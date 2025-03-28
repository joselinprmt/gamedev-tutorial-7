# Tutorial 7: Basic 3D Game Mechanics & Level Design 🎮

![Uploading image.png…]()


## Penambahan yang dilakukan

- Implementasi Sprinting (Shift atau Right click mouse)
- Implementasi Crouching (CTRL)

## Proses pengerjaan

Pertama, akan ditambah input map untuk sprint dan crouch pada project settings, sesuai key binding yang diinginkan. Disi saya menggunakan Shift atau Right click untuk Sprint dan CTRL untuk Crouch.

![Screenshot 2025-03-28 195021](https://github.com/user-attachments/assets/0059be5c-4f59-4b07-96ac-c3addfa14dce)

Lalu pada script Player.gd, tambahkan beberapa variabel, yaitu sprint speed, sprint acceleration, crouch speed, crouch height, dan standing height untuk mengatur tinggi player ketika crouching. Tambahkan juga state is_sprinting, is_crouching, dan pcap untuk me-reference ke collision shape Player.

![Screenshot 2025-03-28 202322](https://github.com/user-attachments/assets/fbf8be90-f1fc-4495-8eab-ec2daf6a52ad)

Setelahnya, ditambahkan script, dimana untuk sprinting, akan diubah current speed dan accelerationnya menjadi lebih cepat. Sedangkan untuk crouching, akan diubah current speed menjadi lebih lambat, dan height player menjadi lebih pendek, agar terlihat seperti sedang menunduk.

![Screenshot 2025-03-28 202412](https://github.com/user-attachments/assets/94bacf42-4353-4fb9-b57a-27b679819740)

## Referensi

- Sprinting https://youtu.be/q_rZvRmYnsk?si=jcLK7q4KBH9ukEBy
- Crouching https://youtu.be/PqRiIWo8hSE?si=BHhJ1ZbpYe7aLPgf
