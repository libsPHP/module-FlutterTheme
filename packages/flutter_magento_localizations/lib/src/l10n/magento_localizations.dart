import 'package:flutter/widgets.dart';

/// Localized strings for Magento UI widgets.
///
/// Use [MagentoLocalizations.of] to access localized strings:
/// ```dart
/// final l10n = MagentoLocalizations.of(context);
/// Text(l10n.addToCart);
/// ```
abstract class MagentoLocalizations {
  /// Looks up [MagentoLocalizations] from the widget tree.
  static MagentoLocalizations of(BuildContext context) {
    return Localizations.of<MagentoLocalizations>(context, MagentoLocalizations) ??
        MagentoLocalizationsEn();
  }

  /// The localizations delegate.
  static const LocalizationsDelegate<MagentoLocalizations> delegate =
      _MagentoLocalizationsDelegate();

  /// List of supported locales.
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('de'),
    Locale('fr'),
    Locale('ar'),
  ];

  // Cart strings
  String get cartTitle;
  String get cartEmpty;
  String get cartSubtotal;
  String get cartTotal;
  String get cartCheckout;
  String cartItemCount(int count);

  // Product strings
  String get addToCart;
  String get outOfStock;
  String get inStock;
  String get productDetails;
  String get relatedProducts;

  // Checkout strings
  String get shippingAddress;
  String get billingAddress;
  String get paymentMethod;
  String get placeOrder;
  String get orderSummary;
  String get shippingMethod;

  // Form strings
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get confirmPassword;
  String get phone;
  String get address;
  String get city;
  String get country;
  String get state;
  String get zipCode;

  // Action strings
  String get save;
  String get cancel;
  String get delete;
  String get edit;
  String get update;
  String get remove;
  String get continue_;
  String get back;

  // Status strings
  String get loading;
  String get error;
  String get success;
  String get noResults;

  // Validation strings
  String get required;
  String get invalidEmail;
  String get passwordTooShort;
  String get passwordsDoNotMatch;
}

class _MagentoLocalizationsDelegate
    extends LocalizationsDelegate<MagentoLocalizations> {
  const _MagentoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return MagentoLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<MagentoLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'es':
        return MagentoLocalizationsEs();
      case 'de':
        return MagentoLocalizationsDe();
      case 'fr':
        return MagentoLocalizationsFr();
      case 'ar':
        return MagentoLocalizationsAr();
      default:
        return MagentoLocalizationsEn();
    }
  }

  @override
  bool shouldReload(_MagentoLocalizationsDelegate old) => false;
}

/// English localizations.
class MagentoLocalizationsEn extends MagentoLocalizations {
  @override
  String get cartTitle => 'Shopping Cart';
  @override
  String get cartEmpty => 'Your cart is empty';
  @override
  String get cartSubtotal => 'Subtotal';
  @override
  String get cartTotal => 'Total';
  @override
  String get cartCheckout => 'Checkout';
  @override
  String cartItemCount(int count) =>
      count == 1 ? '1 item' : '$count items';

  @override
  String get addToCart => 'Add to Cart';
  @override
  String get outOfStock => 'Out of Stock';
  @override
  String get inStock => 'In Stock';
  @override
  String get productDetails => 'Product Details';
  @override
  String get relatedProducts => 'Related Products';

  @override
  String get shippingAddress => 'Shipping Address';
  @override
  String get billingAddress => 'Billing Address';
  @override
  String get paymentMethod => 'Payment Method';
  @override
  String get placeOrder => 'Place Order';
  @override
  String get orderSummary => 'Order Summary';
  @override
  String get shippingMethod => 'Shipping Method';

  @override
  String get firstName => 'First Name';
  @override
  String get lastName => 'Last Name';
  @override
  String get email => 'Email';
  @override
  String get password => 'Password';
  @override
  String get confirmPassword => 'Confirm Password';
  @override
  String get phone => 'Phone';
  @override
  String get address => 'Address';
  @override
  String get city => 'City';
  @override
  String get country => 'Country';
  @override
  String get state => 'State';
  @override
  String get zipCode => 'ZIP Code';

  @override
  String get save => 'Save';
  @override
  String get cancel => 'Cancel';
  @override
  String get delete => 'Delete';
  @override
  String get edit => 'Edit';
  @override
  String get update => 'Update';
  @override
  String get remove => 'Remove';
  @override
  String get continue_ => 'Continue';
  @override
  String get back => 'Back';

  @override
  String get loading => 'Loading...';
  @override
  String get error => 'Error';
  @override
  String get success => 'Success';
  @override
  String get noResults => 'No results found';

  @override
  String get required => 'This field is required';
  @override
  String get invalidEmail => 'Please enter a valid email';
  @override
  String get passwordTooShort => 'Password must be at least 8 characters';
  @override
  String get passwordsDoNotMatch => 'Passwords do not match';
}

/// Spanish localizations.
class MagentoLocalizationsEs extends MagentoLocalizations {
  @override
  String get cartTitle => 'Carrito de Compras';
  @override
  String get cartEmpty => 'Tu carrito esta vacio';
  @override
  String get cartSubtotal => 'Subtotal';
  @override
  String get cartTotal => 'Total';
  @override
  String get cartCheckout => 'Finalizar Compra';
  @override
  String cartItemCount(int count) =>
      count == 1 ? '1 articulo' : '$count articulos';

  @override
  String get addToCart => 'Agregar al Carrito';
  @override
  String get outOfStock => 'Agotado';
  @override
  String get inStock => 'Disponible';
  @override
  String get productDetails => 'Detalles del Producto';
  @override
  String get relatedProducts => 'Productos Relacionados';

  @override
  String get shippingAddress => 'Direccion de Envio';
  @override
  String get billingAddress => 'Direccion de Facturacion';
  @override
  String get paymentMethod => 'Metodo de Pago';
  @override
  String get placeOrder => 'Realizar Pedido';
  @override
  String get orderSummary => 'Resumen del Pedido';
  @override
  String get shippingMethod => 'Metodo de Envio';

  @override
  String get firstName => 'Nombre';
  @override
  String get lastName => 'Apellido';
  @override
  String get email => 'Correo Electronico';
  @override
  String get password => 'Contrasena';
  @override
  String get confirmPassword => 'Confirmar Contrasena';
  @override
  String get phone => 'Telefono';
  @override
  String get address => 'Direccion';
  @override
  String get city => 'Ciudad';
  @override
  String get country => 'Pais';
  @override
  String get state => 'Estado';
  @override
  String get zipCode => 'Codigo Postal';

  @override
  String get save => 'Guardar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get update => 'Actualizar';
  @override
  String get remove => 'Quitar';
  @override
  String get continue_ => 'Continuar';
  @override
  String get back => 'Atras';

  @override
  String get loading => 'Cargando...';
  @override
  String get error => 'Error';
  @override
  String get success => 'Exito';
  @override
  String get noResults => 'No se encontraron resultados';

  @override
  String get required => 'Este campo es requerido';
  @override
  String get invalidEmail => 'Ingrese un correo valido';
  @override
  String get passwordTooShort => 'La contrasena debe tener al menos 8 caracteres';
  @override
  String get passwordsDoNotMatch => 'Las contrasenas no coinciden';
}

/// German localizations.
class MagentoLocalizationsDe extends MagentoLocalizations {
  @override
  String get cartTitle => 'Warenkorb';
  @override
  String get cartEmpty => 'Ihr Warenkorb ist leer';
  @override
  String get cartSubtotal => 'Zwischensumme';
  @override
  String get cartTotal => 'Gesamtsumme';
  @override
  String get cartCheckout => 'Zur Kasse';
  @override
  String cartItemCount(int count) =>
      count == 1 ? '1 Artikel' : '$count Artikel';

  @override
  String get addToCart => 'In den Warenkorb';
  @override
  String get outOfStock => 'Nicht vorraetig';
  @override
  String get inStock => 'Auf Lager';
  @override
  String get productDetails => 'Produktdetails';
  @override
  String get relatedProducts => 'Aehnliche Produkte';

  @override
  String get shippingAddress => 'Lieferadresse';
  @override
  String get billingAddress => 'Rechnungsadresse';
  @override
  String get paymentMethod => 'Zahlungsmethode';
  @override
  String get placeOrder => 'Bestellung aufgeben';
  @override
  String get orderSummary => 'Bestelluebersicht';
  @override
  String get shippingMethod => 'Versandmethode';

  @override
  String get firstName => 'Vorname';
  @override
  String get lastName => 'Nachname';
  @override
  String get email => 'E-Mail';
  @override
  String get password => 'Passwort';
  @override
  String get confirmPassword => 'Passwort bestaetigen';
  @override
  String get phone => 'Telefon';
  @override
  String get address => 'Adresse';
  @override
  String get city => 'Stadt';
  @override
  String get country => 'Land';
  @override
  String get state => 'Bundesland';
  @override
  String get zipCode => 'Postleitzahl';

  @override
  String get save => 'Speichern';
  @override
  String get cancel => 'Abbrechen';
  @override
  String get delete => 'Loeschen';
  @override
  String get edit => 'Bearbeiten';
  @override
  String get update => 'Aktualisieren';
  @override
  String get remove => 'Entfernen';
  @override
  String get continue_ => 'Weiter';
  @override
  String get back => 'Zurueck';

  @override
  String get loading => 'Laden...';
  @override
  String get error => 'Fehler';
  @override
  String get success => 'Erfolg';
  @override
  String get noResults => 'Keine Ergebnisse gefunden';

  @override
  String get required => 'Dieses Feld ist erforderlich';
  @override
  String get invalidEmail => 'Bitte geben Sie eine gueltige E-Mail ein';
  @override
  String get passwordTooShort => 'Passwort muss mindestens 8 Zeichen haben';
  @override
  String get passwordsDoNotMatch => 'Passwoerter stimmen nicht ueberein';
}

/// French localizations.
class MagentoLocalizationsFr extends MagentoLocalizations {
  @override
  String get cartTitle => 'Panier';
  @override
  String get cartEmpty => 'Votre panier est vide';
  @override
  String get cartSubtotal => 'Sous-total';
  @override
  String get cartTotal => 'Total';
  @override
  String get cartCheckout => 'Passer la commande';
  @override
  String cartItemCount(int count) =>
      count == 1 ? '1 article' : '$count articles';

  @override
  String get addToCart => 'Ajouter au panier';
  @override
  String get outOfStock => 'Rupture de stock';
  @override
  String get inStock => 'En stock';
  @override
  String get productDetails => 'Details du produit';
  @override
  String get relatedProducts => 'Produits similaires';

  @override
  String get shippingAddress => 'Adresse de livraison';
  @override
  String get billingAddress => 'Adresse de facturation';
  @override
  String get paymentMethod => 'Mode de paiement';
  @override
  String get placeOrder => 'Passer la commande';
  @override
  String get orderSummary => 'Resume de la commande';
  @override
  String get shippingMethod => 'Mode de livraison';

  @override
  String get firstName => 'Prenom';
  @override
  String get lastName => 'Nom';
  @override
  String get email => 'E-mail';
  @override
  String get password => 'Mot de passe';
  @override
  String get confirmPassword => 'Confirmer le mot de passe';
  @override
  String get phone => 'Telephone';
  @override
  String get address => 'Adresse';
  @override
  String get city => 'Ville';
  @override
  String get country => 'Pays';
  @override
  String get state => 'Region';
  @override
  String get zipCode => 'Code postal';

  @override
  String get save => 'Enregistrer';
  @override
  String get cancel => 'Annuler';
  @override
  String get delete => 'Supprimer';
  @override
  String get edit => 'Modifier';
  @override
  String get update => 'Mettre a jour';
  @override
  String get remove => 'Retirer';
  @override
  String get continue_ => 'Continuer';
  @override
  String get back => 'Retour';

  @override
  String get loading => 'Chargement...';
  @override
  String get error => 'Erreur';
  @override
  String get success => 'Succes';
  @override
  String get noResults => 'Aucun resultat trouve';

  @override
  String get required => 'Ce champ est requis';
  @override
  String get invalidEmail => 'Veuillez entrer un e-mail valide';
  @override
  String get passwordTooShort => 'Le mot de passe doit avoir au moins 8 caracteres';
  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';
}

/// Arabic localizations.
class MagentoLocalizationsAr extends MagentoLocalizations {
  @override
  String get cartTitle => 'سلة التسوق';
  @override
  String get cartEmpty => 'سلة التسوق فارغة';
  @override
  String get cartSubtotal => 'المجموع الفرعي';
  @override
  String get cartTotal => 'المجموع';
  @override
  String get cartCheckout => 'الدفع';
  @override
  String cartItemCount(int count) =>
      count == 1 ? 'منتج واحد' : '$count منتجات';

  @override
  String get addToCart => 'اضف الى السلة';
  @override
  String get outOfStock => 'غير متوفر';
  @override
  String get inStock => 'متوفر';
  @override
  String get productDetails => 'تفاصيل المنتج';
  @override
  String get relatedProducts => 'منتجات ذات صلة';

  @override
  String get shippingAddress => 'عنوان الشحن';
  @override
  String get billingAddress => 'عنوان الفاتورة';
  @override
  String get paymentMethod => 'طريقة الدفع';
  @override
  String get placeOrder => 'تأكيد الطلب';
  @override
  String get orderSummary => 'ملخص الطلب';
  @override
  String get shippingMethod => 'طريقة الشحن';

  @override
  String get firstName => 'الاسم الأول';
  @override
  String get lastName => 'اسم العائلة';
  @override
  String get email => 'البريد الالكتروني';
  @override
  String get password => 'كلمة المرور';
  @override
  String get confirmPassword => 'تأكيد كلمة المرور';
  @override
  String get phone => 'الهاتف';
  @override
  String get address => 'العنوان';
  @override
  String get city => 'المدينة';
  @override
  String get country => 'البلد';
  @override
  String get state => 'المنطقة';
  @override
  String get zipCode => 'الرمز البريدي';

  @override
  String get save => 'حفظ';
  @override
  String get cancel => 'الغاء';
  @override
  String get delete => 'حذف';
  @override
  String get edit => 'تعديل';
  @override
  String get update => 'تحديث';
  @override
  String get remove => 'ازالة';
  @override
  String get continue_ => 'متابعة';
  @override
  String get back => 'رجوع';

  @override
  String get loading => 'جاري التحميل...';
  @override
  String get error => 'خطأ';
  @override
  String get success => 'نجاح';
  @override
  String get noResults => 'لا توجد نتائج';

  @override
  String get required => 'هذا الحقل مطلوب';
  @override
  String get invalidEmail => 'يرجى ادخال بريد الكتروني صحيح';
  @override
  String get passwordTooShort => 'يجب ان تكون كلمة المرور 8 احرف على الاقل';
  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';
}
