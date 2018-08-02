#!/bin/bash

#FARM script for generating model files

# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=`dirname "${BASH_SOURCE[0]}"`


if [ $# -eq 4 ];then

	if [ "$(uname)" == "Darwin" ]; then
		if hash /Applications/MATLAB_R2014b.app/bin/matlab 2>/dev/null; then
			echo "MATLAB 1 running"
			/Applications/MATLAB_R2014b.app/bin/matlab -nodesktop -nodisplay -nosplash -r "$DIR/FARM('$1','$2','$3', '$4', '$DIR')" 
		else
			echo "Octave running"
			octave $DIR"/FARM1.m" $1 $2 $3
		fi
	else
		if hash matlab 2>/dev/null; then
			echo "MATLAB 2 running"
#			matlab -nodesktop -nodisplay -nosplash -r "cd('$DIR');FARM('$1','$2','$3', '$4', '$DIR')"
			matlab -nodesktop -nodisplay -nosplash -r "addpath('$DIR'); FARM('$1','$2','$3', '$4', '$DIR')"
		else 
			echo "Octave running"
				octave $DIR"/FARM1.m" $1 $2 $3
		fi

	fi
    
# elif [ $# -eq 1 ] && [ "$1" == "--help" ];then
else 
	echo "This code is implementation of FARM by Dr. Rahul Garg"
	echo "Usage: bash farm.sh <fMRI_filename> <lambda_vale> <output_foldername> <threshold>"
	echo "It will output 5 files-"
	echo "1) Prediction Power\n (nii file)"
	echo "2) effect of all voxels on a particular voxel\n (nii file)"
	echo "3) Number of steps taken by the LASSO \n (nii file)"
	echo "4) Residuals\n (nii file)"
	echo "5) Model file storing the A matrix (csv file)"

# else
fi

