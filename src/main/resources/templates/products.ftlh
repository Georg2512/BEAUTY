<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="bcg">
    <div class="container padd">
    <h1 class="mb-4 padd" style="text-align: center">Наши услуги</h1>
<#--    <hr>-->
<#--   <form method="get" action="/">-->
<#--        <div class="form-row">-->
<#--            <div class="form-group col-md-2">-->
<#--                <label for="searchCity">Город</label>-->
<#--                <select id="searchCity" class="form-control">-->
<#--                    <option value="">Город не выбран</option>-->
<#--                    <option value="Москва">Москва</option>-->
<#--                    <option value="Красноярск">Красноярск</option>-->
<#--                    <option value="Казань">Казань</option>-->
<#--                </select>-->
<#--            </div>-->
<#--            <div class="form-group col-md-10">-->
<#--                <label for="searchWord">Поиск по объявлениям</label>-->
<#--                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"-->
<#--                       id="searchWord">-->
<#--            </div>-->
<#--            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>-->
<#--        </div>-->
<#--    </form>-->
<#--    <hr>-->

    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white my-3 product">
                    <form action="" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
<#--                        <p class="card-text">${product.price} ₽</p>-->
                        <p style="text-align: justify">${product.description}</p>
                    </div>
<#--                    <div class="card-footer">-->
<#--                        ${product.city}-->
<#--                    </div>-->
                    <div class="product-link"><#if user.active>
                            <input type="date" name="_csrf" />
                            <input type="time" name="_csrf"/>
                            <a href="/sendMail" class="btn btn-primary" >Записаться</a>
                        <#else><a href="/sendMail" class="btn btn-primary" >Записаться</a>
                        </#if></div>
                </div>
            </a>

        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>

    </div>
    </div>
    </div>
    <div class="bcg2 padd">
        <div class="container2">
    <h1 class="mb-4 padd" style="text-align: center">Наши работы</h1>
    <div class="card-columns">
            <img
                    src="static/images/75af9dd3c5d9d899877a2aa9f3296a89.jpeg"
                    class="card-img-top mb-4"
                    alt="Boat on Calm Water"
            />

            <img
                    src="static/images/146a2353cac1d22302954e092f745fb9.jpeg"
                    class="card-img-top mb-4"
                    alt="Wintry Mountain Landscape"
            />
            <img
                    src="static/images/em_0019.jpg"
                    class="card-img-top mb-4"
                    alt="Mountains in the Clouds"
            />
            <img
                    src="static/images/kak-izmenilis-ceny-v-parikmaherskih-i-salonah-krasoty-samary-photo-big.jpg"
                    class="card-img-top mb-4"
                    alt="Boat on Calm Water"
            />
            <img
                    src="static/images/146a2353cac1d22302954e092f745fb9.jpeg"
                    class="card-img-top mb-4"
                    alt="Wintry Mountain Landscape"
            />
            <img
                    src="static/images/em_0019.jpg"
                    class="card-img-top mb-4"
                    alt="Mountains in the Clouds"
            />
    </div>
    </div>
    </div>
    <div class="bcg3 padd">
        <div class="container3">
            <h1 class="mb-4 padd" style="text-align: center">Стоимость услуг</h1>
            <div class="row d-flex justify-content-around"style="padding-bottom: 50px">
                <h2>Прически</h2>
                <h2>Маникюр</h2>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="container4">
                    <div class="row">
                        <div class="col">Стрижка бокс</div>
                        <div class="col text-right">300Р</div>
                    </div>
                    <hr>
                </div>
                <div class="container4">
                    <div class="row">
                        <div class="col">Маникюр Блондинка</div>
                        <div class="col text-right">900Р</div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</@t.template>