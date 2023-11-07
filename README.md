# Image Undo Action
This is a program which attempts to undo the last action taken on an image. It will examine whether the image has a corresponding
origination image and then undo the action based on the name of the image. For example if a box filter was applied to an image, the
name should reflect box_filter and then the program will look in the origination directory for an image without the box_filter in
the name to determine the target to undo the transformation. It will then compare the undone image to the original image to determine
whether the undo worked correctly.

## Project Description

I am beginning by just transforming the image from RGB to grayscale to determine whether the back and forth impacts the image.

## Code Organization

```bin/```
This folder holds all binary/executable code built using the Makefile.

```data/```
This folder contains the files used to make the program actually do something.

```data/src_images/```
These are images which were trnasformed into something else. They are only here for comparison purposes.

```data/transformed_images/```
These are the images after transformation. We will attempt to transform these back to the src_images.

```data/undone_images/```
These are the images which resulted from trying to undo the transformation which reviously occurred.

```lib/```
Extra libraries. This may disappear.

```src/```
The source code should be placed here in a hierarchical fashion, as appropriate.

```README.md```
This file.

```INSTALL```
This file explains how the executable expects to reside.

```Makefile```
This is a standard Makefile for building and executing the code.

```run.sh```
An optional script used to run your executable code, either with or without command-line arguments.