# Import Libraries
import os
import numpy as np
import torch
import torch.nn as nn
import torch.nn.parallel
import torch.backends.cudnn as cudnn
from torch.autograd import Variable
import torch.utils.data
import torchvision.transforms as transforms
import torchvision.datasets as datasets
from PIL import Image
import math
import time
from matplotlib.pyplot import imshow
import torch.optim as optim
# Build Fire Unit and Squeeze Net Model
# squeeze_planes(1x1 conv) - (expand1x1_planes + expand3x3_planes)
class Fire(nn.Module):
    
    def __init__(self, inplanes, squeeze_planes,
                 expand1x1_planes, expand3x3_planes):
        super(Fire, self).__init__()
        self.inplanes = inplanes
        self.squeeze = nn.Conv2d(inplanes, squeeze_planes, kernel_size=1)
        self.squeeze_activation = nn.ReLU(inplace=True)
        self.expand1x1 = nn.Conv2d(squeeze_planes, expand1x1_planes,
                                   kernel_size=1)
        self.expand1x1_activation = nn.ReLU(inplace=True)
        self.expand3x3 = nn.Conv2d(squeeze_planes, expand3x3_planes,
                                   kernel_size=3, padding=1)
        self.expand3x3_activation = nn.ReLU(inplace=True)

    def forward(self, x):
        x = self.squeeze_activation(self.squeeze(x))
        return torch.cat([
            self.expand1x1_activation(self.expand1x1(x)),
            self.expand3x3_activation(self.expand3x3(x))], 1)

class SqueezeNet(nn.Module):
    
    def __init__(self, num_classes=1000):
        super(SqueezeNet, self).__init__()
        
        self.num_classes = num_classes

        self.features = nn.Sequential(
            nn.Conv2d(3, 64, kernel_size=3, stride=2),
            nn.ReLU(inplace=True),
            nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True),
            Fire(64, 16, 64, 64),
            Fire(128, 16, 64, 64),
            nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True),
            Fire(128, 32, 128, 128),
            Fire(256, 32, 128, 128),
            nn.MaxPool2d(kernel_size=3, stride=2, ceil_mode=True),
            Fire(256, 48, 192, 192),
            Fire(384, 48, 192, 192),
            Fire(384, 64, 256, 256),
            Fire(512, 64, 256, 256),
        )
        # Final convolution is initialized differently form the rest
        final_conv = nn.Conv2d(512, self.num_classes, kernel_size=1)
        self.classifier = nn.Sequential(
            nn.Dropout(p=0.5),
            final_conv,
            nn.ReLU(inplace=True),
            nn.AvgPool2d(13, stride=1)
        )

    def forward(self, x):
        x = self.features(x)
        x = self.classifier(x)
        
        return x.view(x.size(0), self.num_classes)

# Load Squeezenet Params
model = SqueezeNet()
model.load_state_dict(torch.load('squeezenet1_1.pth'),strict=False)

params = model.state_dict() 

#remove # to see the params index
for k,v in params.items():
    #print parameter name
    print(k,params[k].numpy().shape)


# Test Squeeze Net
# load the test image
im_path = r'cat.jpg'
im = Image.open(im_path)

#visualize the image
imshow(im)

#preprocess of the imput image
transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean = [ 0.485, 0.456, 0.406 ],
                         std = [ 0.229, 0.224, 0.225 ]),
])
im_input = transform(im)

#add a new axis for pytorch
im_input = im_input.numpy()
im_input = im_input[np.newaxis,:]
im_input = torch.from_numpy(im_input)

# Prediction
model.cpu()
im_input_torch = Variable(im_input)
im_output_torch = model(im_input_torch)
_, predicted = torch.max(im_output_torch.data, 1)
print('the label index prediction of pytorch implement: %d' % predicted.numpy()[0])

## Freeze the layers
for param in model.parameters():
    param.requires_grad = False

# Visualize Model Structure
#print(model)

# Modify the last layer
features = list(model.classifier.children())[:-1] # Remove last layer
# New Layer
# Final convolution is initialized differently form the rest
newfinal_conv = nn.Conv2d(512, 11, kernel_size=1)
newclassifier = nn.Sequential(
    nn.Dropout(p=0.5),
    newfinal_conv,
    nn.ReLU(inplace=True),
    nn.AvgPool2d(13, stride=1)
)
model.classifier = newclassifier
print(model)

# Define Hyper Parameters
criterion = torch.nn.CrossEntropyLoss()
optimizer_ft = optim.SGD(model.parameters(), lr=0.01, momentum=0.9)


# Load Dataset
import os
import time
import torch
import torchvision
from torchvision import datasets, models, transforms
import torch.optim as optim
import numpy as np
import matplotlib.pyplot as plt

data_dir = "dataset"
input_shape = 224
mean = [0.5, 0.5, 0.5]
std = [0.5, 0.5, 0.5]

#data transformation
data_transforms = {
   'train': transforms.Compose([
       transforms.CenterCrop(input_shape),
       transforms.ToTensor(),
       transforms.Normalize(mean, std)
   ]),
   'validation': transforms.Compose([
       transforms.CenterCrop(input_shape),
       transforms.ToTensor(),
       transforms.Normalize(mean, std)
   ]),
}

image_datasets = {
   x: datasets.ImageFolder(
       os.path.join(data_dir, x),
       transform=data_transforms[x]
   )
   for x in ['train', 'validation']
}

dataloaders = {
   x: torch.utils.data.DataLoader(
       image_datasets[x], batch_size=10,
       shuffle=True
   )
   for x in ['train', 'validation']
}

dataset_sizes = {x: len(image_datasets[x]) for x in ['train', 'validation']}

print(dataset_sizes)
class_names = image_datasets['train'].classes
print(class_names)

device = torch.device("cpu")

# Visualize Dataset
images, labels = next(iter(dataloaders['train']))

rows = 1
columns = 1
fig=plt.figure()
for i in range(rows*columns):
   fig.add_subplot(rows, columns, i+1)
   plt.title(class_names[labels[i]])
   img = images[i].numpy().transpose((1, 2, 0))
   img = std * img + mean
   plt.imshow(img)
plt.show()
val_losses = []
train_losses = []

# Training and Testing Model
def train_model(model, criterion, optimizer, num_epochs=25):
    since = time.time()

    for epoch in range(num_epochs):
        print('Epoch {}/{}'.format(epoch, num_epochs - 1))
        print('-' * 10)

        #set model to trainable
        train_loss = 0

        # Iterate over data.
        for i, data in enumerate(dataloaders['train']):
            inputs , labels = data
            inputs = inputs.to(device)
            labels = labels.to(device)

            optimizer.zero_grad()
            
            with torch.set_grad_enabled(True):
                outputs  = model(inputs)
                #print(inputs.shape)
                loss = criterion(outputs, labels)

            loss.backward()
            optimizer.step()

            train_loss += loss.item() * inputs.size(0)
        print('{} Loss: {:.4f}'.format(
            'train', train_loss / dataset_sizes['train']))
        train_losses.append(loss.item())

    time_elapsed = time.time() - since
    print('Training complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))

    return model

def validate_model(model,criterion, num_epochs=25):
    since = time.time()
    for epoch in range(num_epochs):
        print('Epoch {}/{}'.format(epoch, num_epochs - 1))
        print('-' * 10)
        #set model to trainable
        # model.train()
        val_loss = 0
       # Iterate over data.
        for i, data in enumerate(dataloaders['validation']):
            inputs , labels = data
            inputs = inputs.to(device)
            labels = labels.to(device)
          
            outputs  = model(inputs)
            loss = criterion(outputs, labels)

            val_loss += loss.item() * inputs.size(0)
            print('{} Loss: {:.4f}'.format(
               'validate', val_loss / dataset_sizes['validation']))
        val_losses.append(loss.item())

        time_elapsed = time.time() - since
        print('Validation complete in {:.0f}m {:.0f}s'.format(
            time_elapsed // 60, time_elapsed % 60))

    return model

def visualize_model(model, num_images=6):
   was_training = model.training
   model.eval()
   images_so_far = 0
   fig = plt.figure()

   with torch.no_grad():
       for i, (inputs, labels) in enumerate(dataloaders['validation']):
           inputs = inputs.to(device)
           labels = labels.to(device)

           outputs = model(inputs)
           _, preds = torch.max(outputs, 1)

           for j in range(inputs.size()[0]):
               images_so_far += 1
               ax = plt.subplot(num_images//2, 2, images_so_far)
               ax.axis('off')
               ax.set_title('predicted: {} truth: {}'.format(class_names[preds[j]], class_names[labels[j]]))
               img = inputs.cpu().data[j].numpy().transpose((1, 2, 0))
               img = std * img + mean
               ax.imshow(img)

               if images_so_far == num_images:
                   model.train(mode=was_training)
                   return
       model.train(mode=was_training)
model.num_classes = 11
gesturenet = train_model(model, criterion, optimizer_ft, num_epochs=100)
validate_model(model,criterion,num_epochs=100)
visualize_model(gesturenet)

plt.show()

plt.figure(figsize=(10,5))
plt.title("Training Loss")
plt.plot(train_losses,label="train")
plt.xlabel("iterations")
plt.ylabel("Loss")
plt.legend()
plt.show()

plt.figure(figsize=(10,5))
plt.title("Validation Loss")
plt.plot(val_losses,label="validate")
plt.xlabel("iterations")
plt.ylabel("Loss")
plt.legend()
plt.show()

params = gesturenet.state_dict()
print(params.keys())
print(params['classifier.1.weight'].shape)
print(params['classifier.1.bias'].shape)
biases=[]
num_class=11
weights=np.zeros((num_class,512,1,1))
for i in range (0,len(params['classifier.1.bias'])):
    biases.append(str(params['classifier.1.bias'][i].item())[:9])
print(biases)
for j in range(0, num_class):
    for i in range (0,512):
        weights[j][i][0][0]=str(params['classifier.1.weight'][j][i][0][0].item())[:9]

with open('classifier_weights.txt', 'w') as testfile:
    testfile.write('//Classifier Weights \n')
    testfile.write('float classifier_conv_weight[] = {\n')
    for cx in range(0,num_class):
        for wx in range(0,512):
            if wx%5==0 and wx!=0:
                testfile.write('\n')
            if wx == 512-1 and cx == num_class-1:
                testfile.write(str(weights[cx][wx][0][0])+'f')
            else:
                testfile.write(str(weights[cx][wx][0][0])+'f,')
    testfile.write('};\n')
    testfile.write('float classifier_conv_bias[] = {\n')
    for rx in range(0,len(biases)):
        if rx != len(biases)-1:
            testfile.write(biases[rx]+'f,')
        else:
            testfile.write(biases[rx]+'f')
    testfile.write('};\n')

# Save Gesture Net
torch.save(gesturenet.state_dict(), 'GestureNetv2.pth')