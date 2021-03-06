<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="tile">

    <div class="tile-header dvd dvd-btm bg-greensea">
        <c:if test="${not empty drink}">
            <h1 class="custom-font"><strong>Modifier Boisson</strong></h1>
        </c:if>
        <c:if test="${empty drink}">
            <h1 class="custom-font"><strong>Nouvelle Boisson</strong></h1>
        </c:if>
    </div>
    <form action="FrontController?option=drink" class="form-horizontal" method="POST">

        <div class="tile-body">
            <div id="drinkFormats" class="form-group">
                <label for="comboFormat" class="col-sm-2 control-label">Format</label>
                <div class="col-sm-10">
                    <select id="comboFormat" name="comboFormat">
                        <c:forEach var="format" items="${formats}" varStatus="loop"> 
                            <option name="format" value="${format.id}" <c:if test="${drink.format.name eq format.name}">selected</c:if>>${format.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="comboCategory" class="col-sm-2 control-label">Catégorie :</label>
                <div class="col-sm-10">
                    <select id="comboCategory" name="comboCategory" class="form-control">
                        <c:forEach var="category" items="${categories}" varStatus="loop">
                            <c:if test="${not empty drink}">
                                <c:if test="${drink.category.id==category.id}">
                                    <option selected>${category.name}</option>
                                </c:if>
                                <c:if test="${drink.category.id!=category.id}">
                                    <option>${category.name}</option>
                                </c:if>
                            </c:if>

                            <c:if test="${empty drink}">
                                <option>${category.name}</option>
                            </c:if>   
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">

                <label for="name" class="col-sm-2 control-label">Nom : </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" value="${drink.name}"> 
                </div>
            </div>
            <div class="form-group">

                <label for="inventory" class="col-sm-2 control-label">Stock : </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inventory" name="inventory" value="${drink.inventory}">
                </div>
            </div>
            <div class="form-group">

                <label for="description" class="col-sm-2 control-label">Description : </label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" maxlength="500" id="description" name="description">${drink.description}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="comboDiscount" class="col-sm-2 control-label">Discount : </label>
                <div class="col-sm-10">
                    <select id="comboDiscount" name="comboDiscount" class="form-control">
                        <c:if test="${empty drink.discount || empty drink}">
                            <option value="empty"></option>
                        </c:if>
                        <c:forEach var="discount" items="${discounts}" varStatus="loop">
                            <c:if test="${drink.discount.id==discount.id}">
                                <option value="${discount.id}" selected>${discount.rate} / <fmt:formatDate value="${discount.beginDate}" pattern="dd MMM yyyy" /> / <fmt:formatDate value="${discount.endDate}" pattern="dd MMM yyyy" /> </option>
                            </c:if>
                            <c:if test="${drink.discount.id!=discount.id}">
                                <option value="${discount.id}">${discount.rate} / <fmt:formatDate value="${discount.beginDate}" pattern="dd MMM yyyy" /> / <fmt:formatDate value="${discount.endDate}" pattern="dd MMM yyyy" /></option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <div class="mt-10">
                        <a href="FrontController?option=rate&task=editDiscount" class="btn btn-greensea btn-rounded btn-ef btn-ef-5 btn-ef-5a" name="addDiscount">Nouveau Discount</a>
                        <c:if test="${not empty drink && not empty drink.discount}">
                            <a href="FrontController?option=drink&task=deleteDiscountDrink&id=${drink.id}" class="btn btn-lightred btn-rounded btn-ef btn-ef-5 btn-ef-5a" name="deleteDiscountDrink">Détacher Discount</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="comboTax" class="col-sm-2 control-label">Taxe : </label>
                <div class="col-sm-10">
                    <select id="comboTax" name="comboTax" class="form-control">
                        <c:forEach var="tax" items="${taxes}" varStatus="loop">
                            <c:if test="${not empty drink}">
                                <c:if test="${drink.tax.id==tax.id}">
                                    <option selected>${tax.rate}</option>
                                </c:if>
                                <c:if test="${drink.tax.id!=tax.id}">
                                    <option>${tax.rate}</option>
                                </c:if>
                            </c:if>

                            <c:if test="${empty drink}">
                                <option name="${tax.id}">${tax.rate}</option>
                            </c:if>   
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="price" class="col-sm-2 control-label">Prix HT : </label>
                <div class="col-sm-10">
                    <input type="text" id="price" class="form-control" name="price" value="${drink.price}">
                </div>
            </div>
            <c:if test="${not empty drink}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Prix TTC : </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="totalPrice" value="${drink.totalPrice}" disabled>
                    </div>
                </div>
            </c:if>
            <div class="form-group">
                <label for="image" class="col-sm-2 control-label">Image : </label>
                <div class="col-sm-10">
                    <input type="file" id="image" name="image" accept="image/jpeg"/>
                    <c:if test="${empty drink.image}">
                        <p>Vous n'avez pas d'image attachée à cette boisson</p>
                    </c:if>
                    <c:if test="${not empty drink.image}">
                        <input type="text" disabled name="attachedImage" value="${drink.image}"/>
                    </c:if>  
                </div>
            </div>
        </div>

        <div class="tile-footer dvd dvd-top">
            <div class="row">
                <div class="col-xs-12 text-right">
                    <a href="FrontController?option=drink" class="btn btn-darkgray btn-rounded btn-ef btn-ef-5 btn-ef-5a"><i class="fa fa-remove"></i> <span>Annuler</span></a>
                    <c:if test="${not empty drink}">
                        <button type="submit" class="btn btn-greensea btn-rounded btn-ef btn-ef-5 btn-ef-5a" name="modifyIt"><i class="fa fa-save"></i> <span>Modifier</span></button>
                    </c:if>
                    <c:if test="${empty drink}">
                        <button type="submit" class="btn btn-greensea btn-rounded btn-ef btn-ef-5 btn-ef-5a" name="createIt"><i class="fa fa-save"></i> <span>Valider</span></button>
                    </c:if>
                </div>
            </div>
        </div>
    </form>
</section>
