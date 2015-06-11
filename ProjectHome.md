ToasterLib is a Flex library mainly designed to help you display "toast-like" notifications. These notifications are similar to the notifications you get from popular desktop programs like MSN, avast! or GTalk.
Notifications (called "ToastMessages" in this context) can appear from any corner of the screen or in the center.
They behave a bit like "Alert-popups" but are **less intrusive** and don't block navigation.
Notifications are **highly customizable are re-usable**. Simply create a ToastMessage Object (MXML or ActionScript) extending the base you can find in the library. Toasts can have **any UI Component you like** and are still interactive.
You can **style** your toast like you would with any other component. Check the example to see GTalk, avast! and Ubuntu-like toasts.
Toasts come with **basic fading in/out effects** but you can create your own effect set to override the existing one.

This library is free of use, even commercial use. Donations are welcome. If you feel like the library saved you a few hours of development, feel free to make a [Paypal donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8425228)

Flex 4 compatible version of this library is also available, you can download the SWC from the Downloads section. If you want to checkout the source, checkout the "ToasterLibFx4" branch.

Created by Fabien Nicollet [Flex Tutorial](http://www.flex-tutorial.fr), fnicollet (AT) gmail (DOT) com


---

## FRENCH ##


ToasterLib est une librairie Flex, principalement créée pour vous aider à afficher des notifications "toast". Ces notifications sont semblables aux notifications présentes dans les logiciels bureautiques tels que MSN, avast! ou GTalk.
Les notifications (ici appellées "ToastMessages) peuvent apparaître depuis n'importe quel coin de l'écran ou au centre.
Elles se comportent un peu comme les popups type Alert mais sont **moins intrusives** et ne bloquent pas la navigation.
Les toasts sont **personnalisables et ré-utilisables**. Créez simplement un objet ToastMessage (MXML ou ActionScript) en héritant des classes de base que vous trouverez dans la librairie ToasterLib. Les Toasts peuvent comporter **tous les composants visuels** que vous souhaitez (qui garderont leur interactivité).
Vous pouvez donner du **style** à votre toast comme vous le feriez pour tout autre composant. Jettez un oeil aux exemples pour vous les toasts à-la-Gtalk / avast! et Ubuntu.
Les toasts ont de base des **effets d'apparition / disparition** mais vous pouvez créer votre propre ensemble d'effets pour surcharger ceux existants.

Cette librairie est libre d'usage, même commercial. Si vous trouvez que cette librairie vous a sauvé plusieurs heures de développement, vous pouvez faire un [don Paypal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8425228)

Une version de cette librairie compatible avec Flex 4 est disponible dans la section Download. Si vous utilisez SVN, faîtes un checkout de la branche "ToasterLibFx4".

Crée par Fabien Nicollet [Flex Tutorial](http://www.flex-tutorial.fr), fnicollet (AT) gmail (DOT) com


---

## Latest Modifications ##
27/06/2010 : Release of a Flex 4 compatible version of the library.

26/06/2010 : Fixed a wrong position when adding a toast while another one was being closed (v1.0.3)

04/02/2010 : Fixed a bug when resizing the parent container: http://code.google.com/p/flex-toasterlib/issues/detail?id=1

03/02/2010 : Added some metadata on ToastContainerBase (onToastAdded / onToastRemoved) and a setter for the effect descriptor
