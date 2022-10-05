## Bài 4: Hãy học cách sử dụng Terraform Cloud để làm lại bài số 1. Bài này để tiết kiệm tài nguyên em xin phép chạy Terraform tạo 1 EC2 instace 



Các bước thực hiện:
1.	Thực hiện login vào trang chủ sau khi đã đăng kí tài khoản cá nhân thành công

![markdown](image\1_Dangnhap_Workspace.png)

2.	Thêm đoạn code config được generate từ Terraform và add vào bất kì chỗ nào chạy fie .tf bên trong thư mục ở đó chạy Terraform

![markdown](image\2_layCode.png)


3.	Thực hiện add config vào trong code , ở đây em thực hiện add vào phần provider

![markdown](image\3_addCode.png)

4.	Tiến hành chạy lệnh: terraform login trên máy local

![markdown](image\4_chaylenh_login.png)


- ở đây có 1 đường link sẽ lấy link này để gọi API lấy ra token


![markdown](image\fffff.png)

- Sau khi sinh ra token, sẽ copy đoạn token này vào lệnh tarraform login đang chạy trên terminal local

![markdown](image\5_Dangnhap_Terminal.png)

Giao diện đăng nhập thành công

5.	Bài này em chạy 1 file terraform để tạo 1 EC2, thì đã có lỗi bắn ra từ server, toàn bộ config liên quan tới credential như là secret key và access key của AWS ta đều phải config ở trên remote backend. 

![markdown](image\6_loi.png)

6.	Tiến hành add secret key và access key của AWS vào hệ thống Terraform backend. Key này là của user admin được tạo ra từ IAM 


![markdown](image\7_savekey.png)

7.	Sau khi add thành công thì tiến hành replan lại file .tf. Lúc này không còn báo lỗi nữa. 

![markdown](image\8_replan.png)

- Chạy lệnh terraform apply đã thành công.


![markdown](image\9_chaysaukhiaddKey.png)