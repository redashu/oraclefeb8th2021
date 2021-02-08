FROM python
# pull or using python based docker image 
# build instruction will connect with DE to check or pull 
## python image from Docker hub 
MAINTAINER  ashutoshh@linux.com , 9509957594
# optional field but info about image designer 
RUN  mkdir  /mycode
# DE will create a directory during image build time 
# RUN is to Give a SHELL access  during image build time 
COPY while.py /mycode/while.py
# it will take data from source system and paste it to newly created 
# docker image -- location of Dockerfile & local data must be same
WORKDIR /mycode
# changing directory during image build time 
# its like CD command in linux / windows 
RUN chmod +x while.py 
# again shell access 
CMD ["python","while.py"]
# to define the default parent process 
# if we will creating container from this docker image 
