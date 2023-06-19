<#import "blocks/template.ftlh" as t>
<@t.template user>
<div class="card-columns">
    <#list zakaz as zakaz>
    <#if zakaz.mailClient == user.email && zakaz.status == "Создан" || zakaz.mailClient == user.email && zakaz.status == "Возобновлен" || user.isAdmin() >
    <div class="card text-white bg-dark my-3 zakaz">
        <div class="card-body">
            <h5 class="card-title">Заказ от пользователя  ${zakaz.nameClient}</h5>
            <h5 class="card-title">Email пользователя ${zakaz.mailClient}</h5>
            <h5 class="card-title">Дата создания заказа  ${zakaz.dateOfCreated}</h5>
            <h5 class="card-title">Дата на которую оформлен заказ: ${zakaz.date}</h5>
            <h5 class="card-title">Описание заказа: ${zakaz.value}</h5>
            <h5 class="card-title">Исполнитель: ${zakaz.executor}</h5>
            <h5 class="card-title">Статус: ${zakaz.status}</h5>
            <#if user.isAdmin() >
            <form action="/zakaz/update/${zakaz.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-danger m-3">
                    Завершить
                </button>
            </form>

            <form action="/zakaz/exec/${zakaz.id}/exec/${user.name}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-danger m-3">
                    Взять в работу
                </button>
            </form>
            </#if>
            <#else>
        </div>
    </div>
    <div class="product-link">
        </#if>
        <#else>
        <h1 style="text-align: center">Не найдено</h1>
    </#list>

</div>
</@t.template>