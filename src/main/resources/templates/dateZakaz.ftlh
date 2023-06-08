<#import "blocks/template_admin.ftlh" as t>
<@t.template user>
    <div class="card-columns">
    <#list zakaz as zakaz>
    <div class="card text-white bg-dark my-3 zakaz">
        <div class="card-body">
            <h5 class="card-title">Заказ от пользователя  ${zakaz.user.name}</h5>
            <h5 class="card-title">Email пользователя ${zakaz.value}</h5>
            <h5 class="card-title">Дата заказа  ${zakaz.dateOfCreated}</h5>
            <h5 class="card-title">Статус: ${zakaz.status}</h5>
            <h5 class="card-title">Дата на которую оформлен заказ: ${zakaz.date}</h5>
            <form action="/zakaz/delete/${zakaz.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-danger m-3">
                    Завершить
                </button>
            </form>
            </a>
        </div>
    </div>
    <div class="product-link">
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>

    </div>
</@t.template>