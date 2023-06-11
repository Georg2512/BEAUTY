<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск услуг</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">Город</label>
                <select id="searchCity" class="form-control">
                    <option value="">Город не выбран</option>
                    <option value="Москва">Москва</option>
                    <option value="Красноярск">Красноярск</option>
                    <option value="Казань">Казань</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по объявлениям</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>

    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">
                    <form action="" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"> <font color = "white">${product.title}</font></h5>
                        <p class="card-text"> <font color = "white">${product.price} ₽</font> </p>
                    </div>
                    <div class="card-footer">
                        <font color = "white">${product.city}</font>
                        <br>
                        <br>
                        <#if user.active>
                            <a href="/my/zakaz/create" class="btn btn-primary" >Записаться</a>
                        <#else><font color="white">Зарегистрируйтесь чтобы записаться!</font>
                        </#if>
                    </div>
                </div>

            </a>

        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>

    </div>

</@t.template>