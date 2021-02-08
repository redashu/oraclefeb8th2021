FROM python as Builder
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

# FINAL IMAGE WITH APP 
FROM gcr.io/distroless/python3 
# this image will be using for running the code 
COPY --from=Builder /mycode /mycode
# from above builder image i am coping only code data not other libs
WORKDIR /mycode
CMD ["while.py"]



