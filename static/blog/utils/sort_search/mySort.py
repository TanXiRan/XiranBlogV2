from urllib.parse import urlencode


class Sorter:

    def __init__(self, order_ls, category, query_params):
        self.order_ls = order_ls
        self.category = category
        self.query_params = query_params

    def get_order_list(self):
        order_list = []

        order_field = self.query_params.get(self.category, '')
        print(type(order_field))

        if order_field == '' or order_field not in [i[0] for i in self.order_ls]:
            order_list.append(
                f'<li class="active"><a href="?{self.encode_query_params}">{self.order_ls[0][1]}</a></li>')
            self.order_ls = self.order_ls[1:]

        for order in self.order_ls:
            if str(order[0]) == order_field:
                li_tag = f'<li class="active"><a href="?{self.encode_query_params}">{order[1]}</a></li>'
            else:
                self.query_params[self.category] = order[0]
                li_tag = f'<li><a href="?{self.encode_query_params}">{order[1]}</a></li>'
            order_list.append(li_tag)

        # print(order_list)
        return ''.join(order_list)

    @property
    def encode_query_params(self):
        return urlencode(self.query_params, doseq=True)
