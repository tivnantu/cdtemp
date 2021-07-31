# cdtemp

*I just want a simple temp dir!*

## 简介

Linux下的/tmp文件夹里面的内容会随着重启而被销毁，这个特性非常符合一些简单的临时小任务，比如wget一个脚本/图片/网页下来看一看（不想保存），又或者使用ffmpeg转换一个小视频

命令mktemp提供了在/tmp下生成随机文件夹的功能，不过`cd $(mktemp -d)`这个命令太长了点，所以封装了下。mktemp没有提供管理的功能，所以手动做了个简单的脚本轮子--这就是本项目cdtemp的由来

## 使用

- cdtemp : 第一次使用会在/tmp下创建并进入一个随机文件夹，随后使用会进入上次创建的随机文件夹
  
  - -l : 列举目前所有的随机文件夹，每一行表示文件夹位置
  
  - -n : 直接创建一个新的随机文件夹
  
  - [num] : 进入对应文件夹

- 用例 : 
  
  ```shell
  tivnan@ubu:~$ pwd
  /home/tivnan
  tivnan@ubu:~$ cdtemp -l
       1	/tmp/tmp.Co6D6Jtflb
       2	/tmp/tmp.fmO1wCUs4p
       3	/tmp/tmp.DVZ8ucCmRQ
       4	/tmp/tmp.o7BFKrFDqS
       5	/tmp/tmp.6CqwLvcFj7
  tivnan@ubu:~$ cdtemp -n
  /tmp/tmp.fnWoTEbFdA
  tivnan@ubu:/tmp/tmp.fnWoTEbFdA$ cdtemp -l
       1	/tmp/tmp.Co6D6Jtflb
       2	/tmp/tmp.fmO1wCUs4p
       3	/tmp/tmp.DVZ8ucCmRQ
       4	/tmp/tmp.o7BFKrFDqS
       5	/tmp/tmp.6CqwLvcFj7
       6	/tmp/tmp.fnWoTEbFdA
  tivnan@ubu:/tmp/tmp.fnWoTEbFdA$ cdtemp 3
  tivnan@ubu:/tmp/tmp.DVZ8ucCmRQ$ pwd
  /tmp/tmp.DVZ8ucCmRQ
  tivnan@ubu:/tmp/tmp.DVZ8ucCmRQ$ 
  
  ```
