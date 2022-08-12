def get_error_field(form, response):
    """
    定位表单的错误字段
    :param form:
    :param response:
    :return: response
    """
    errors_field_list = list(form.errors.keys())
    first_error_field = errors_field_list[0]
    response['error_field'] = first_error_field
    response['msg'] = form.errors[first_error_field][0]
    return response
