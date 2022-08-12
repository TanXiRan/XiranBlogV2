import math


# 分页器


class Pager:
    def __init__(self, current_page, total_articles, base_url, query_params, per_page_article_number=10,
                 max_page_number=9, position='pos'):
        self.total_articles = total_articles
        self.per_page_article_number = per_page_article_number
        self.max_page_number = max_page_number
        self.base_url = base_url
        self.query_params = query_params
        self.position = position

        self.all_pages = math.ceil(self.total_articles / self.per_page_article_number)

        try:
            self.current_page = int(current_page)
            if not (0 < self.current_page <= self.all_pages):
                self.current_page = 1
        except ValueError:
            # print('value error!')
            self.current_page = 1
        except TypeError:
            # print('TypeError!')
            self.current_page = 1

        # 如果总分页数小于，最大显示页码数，那么最大显示页码数就等于总分页数
        if self.all_pages < self.max_page_number:
            self.max_page_number = self.all_pages
        # 求分页的页码中位数
        self.middle_page = int(self.max_page_number / 2)

    def get_page_list(self):
        start = self.current_page - self.middle_page
        end = self.current_page + self.middle_page

        if self.current_page <= self.middle_page:
            start = 1
            end = self.max_page_number
        elif self.current_page + self.middle_page >= self.all_pages:
            start = self.all_pages - self.max_page_number + 1
            end = self.all_pages
        # print(start, end)

        page_url_list = []

        if self.current_page > 1:
            self.query_params['page'] = self.current_page - 1
            previous_page_url = f'<li><a href="{self.base_url}?{self.encode_query_params}#{self.position}">上一页</a></li>'
            page_url_list.append(previous_page_url)

        for i in range(start, end + 1):
            self.query_params['page'] = i
            if i == self.current_page:
                url = f'<li class="active"><a href="{self.base_url}?/' \
                      f'{self.encode_query_params}#{self.position}">{i}</a></li>'
            else:
                url = f'<li><a href="{self.base_url}?{self.encode_query_params}#{self.position}">{i}</a></li>'
            page_url_list.append(url)

        if self.current_page < self.all_pages:
            self.query_params['page'] = self.current_page + 1
            next_page_url = f'<li><a href="{self.base_url}?{self.encode_query_params}#{self.position}">下一页</a></li>'
            page_url_list.append(next_page_url)

        if len(page_url_list) <= 1:
            page_url_list = []
        # print(''.join(page_url_list))
        return ''.join(page_url_list)

    def switch_to_page(self):
        pass

    @property
    def encode_query_params(self):
        return self.query_params.urlencode()

    @property
    def start(self):
        return self.per_page_article_number * (self.current_page - 1)

    @property
    def end(self):
        return self.per_page_article_number * self.current_page
