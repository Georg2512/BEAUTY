<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Запишитесь</h1>
    <hr>
    <form action="/zakaz/create" method="post">
        <div class="form-group">
            <label for="name">Как вас зовут</label>
            <input type="text" class="form-control" required id="nameClient" name="nameClient" value="${user.name}">
        </div>
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="mailClient" required name="mailClient" value="${user.email}">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Номер телефона</label>
            <input type="text" class="form-control" id="phoneClient" required name="phoneClient" value="${user.phoneNumber}">
        </div>
        <div class="form-group">
            <label for="password">Опишите что нужно</label>
            <input type="text" class="form-control" id="value" required name="value">
        </div>
        <div class="form-group">
            <label for="password">Выберете дату записи</label>
            <input type="date" class="form-control" id="date" required name="date">
        </div>
        <div class="form-group">
            <label for="password">Выберете время записи</label>
            <input type="time" class="form-control" id="date" required name="date">
        </div>
        <div class="form-group">
            <input type="hidden" class="form-control" id="executor" required name="executor" value="Не назначен">
        </div>
        <div class="form-group">
            <input type="hidden" class="form-control" id="status" required name="status" value="Создан">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Отправить</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>