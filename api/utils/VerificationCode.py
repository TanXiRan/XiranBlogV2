from PIL import Image, ImageDraw, ImageFont
import random
import string
from io import BytesIO

# 图片宽高和背景色
image_width = 200
image_height = 80
image_bg_color = (255, 255, 255)

# 验证码数量
string_number = 4
# 验证码的字体颜色、大小、字体文件路径、
font_color = (0, 0, 0)
font_size = 40
font_path = './font/AaLiFangTi.ttf'
# font_path = '/static/font/AaLiFangTi.ttf'

# 验证码的横坐标间隔
sep = int((image_width - 40) / string_number)

# 字符串的纵坐标
y_position = (image_height - font_size) / 2

# 候选字符串
randomStrings = string.digits + string.ascii_letters

# 点的数量
dot_amount = 80

# 线的数量
lines = 12


# 生成随机颜色
def random_color():
    return random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)


# 生成验证码
def generate_code(f_path=font_path):
    # 随机验证码
    var_strings = ''
    # 生成一个Image对象
    img = Image.new('RGB', size=(image_width, image_height), color=image_bg_color)

    # 声明一个ImageDraw对象
    draw = ImageDraw.Draw(img)

    # 生成验证码
    for i in range(4):
        var_string = random.choice(randomStrings)
        var_strings += var_string
        font = ImageFont.truetype(font=f_path, size=font_size)
        draw.text((i * sep + 20, y_position + random.randint(-5, 5)), var_string, font_color, font=font)

    # 加上点
    for i in range(dot_amount):
        point = (random.randint(0, image_width), random.randint(0, image_height))
        draw.point(point, fill=random_color())

    # 加上线
    for i in range(lines):
        x1, y1 = random.randint(0, image_width), random.randint(0, image_height)
        x2, y2 = random.randint(0, image_width), random.randint(0, image_height)
        draw.line(xy=(x1, y1, x2, y2), fill=random_color(), width=1)

    # 声明一个IO字节流对象
    file = BytesIO()
    # 把img写入file中
    img.save(file, 'png')
    # 获取img的字节流数据
    data = file.getvalue()
    # 返回随机验证码和图片的字节流数据
    return data, var_strings
