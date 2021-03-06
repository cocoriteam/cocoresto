<div class="row">

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-greensea">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-th fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Employ�s</p>
                        <span>${countEmployee}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-greensea">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=employee"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=employee&task=edit"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-lightred">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-th fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Tables</p>
                        <span>${countCustomerTable}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-lightred">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=customerTable"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=customerTable&task=add"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-orange">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-barcode fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Commandes</p>
                        <span>${countCustomerOrder}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-orange">
                <div class="row">
                    <div class="col-xs-12">
                        <a href="FrontController?option=customerOrder"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-green">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-euro fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Promotions</p>
                        <span>${countDiscount}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-green">
                <div class="row">
                    <div class="col-xs-4">
                        <a href="FrontController?option=rate"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-4">
                        <a href="FrontController?option=rate&task=editTax"><i class="fa fa-plus fa-2x"></i> Taxe</a>
                    </div>
                    <div class="col-xs-4">
                        <a href="FrontController?option=rate&task=editDiscount"><i class="fa fa-plus fa-2x"></i> Promotion</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-blue">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-folder-open fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Cat�gories</p>
                        <span>${countCategory}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-blue">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=category"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=category&task=edit"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-slategray">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-cutlery fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Plats</p>
                        <span>${countDish}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-slategray">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=dish"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=dish&task=edit"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-cyan">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-glass fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Boissons</p>
                        <span>${countDrink}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-cyan">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=drink"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=drink&task=edit"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-container col-lg-3 col-sm-6 col-sm-12">
        <div class="card">
            <div class="front bg-amethyst">
                <div class="row">
                    <div class="col-xs-4">
                        <i class="fa fa-file fa-4x"></i>
                    </div>
                    <div class="col-xs-8">
                        <p class="text-elg text-strong mb-0">Menus</p>
                        <span>${countCombo}</span>
                    </div>
                </div>
            </div>
            <div class="back bg-amethyst">
                <div class="row">
                    <div class="col-xs-6">
                        <a href="FrontController?option=combo"><i class="fa fa-list fa-2x"></i> Voir la liste</a>
                    </div>
                    <div class="col-xs-6">
                        <a href="FrontController?option=combo&task=edit"><i class="fa fa-plus fa-2x"></i> Ajouter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

