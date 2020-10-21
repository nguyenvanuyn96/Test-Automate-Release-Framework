# Change logs
This is change log of TKProductDetails module in 2020.

## [Unreleased]
### Enhancements
- fkjahskjdhfkjahsdjfk
- Item 2

### Bug Fixing
- Fix bug kljldskjflkajs;df

## [Released] 1.0.29
### Enhancements
- Update Listing Ux and UI - [TAS-4102](https://jira.tiki.com.vn/browse/TAS-4102)
- Show Best price badge - [TAS-4115](https://jira.tiki.com.vn/browse/TAS-4115)
- Expand fully product image - https://jira.tiki.com.vn/browse/TAS-3206

### Bug Fixing
- Fix wrong mapping event in trackity
- Fixed ads x-axis position issue.

## [Released] 1.0.28
### Enhancements
- start adding test cases and integrate CI
- Create TikiNGON Hub Home Screen - https://jira.tiki.com.vn/browse/TAS-3693
- Create new Fresh Seller Store - https://jira.tiki.com.vn/browse/TAS-3694

### Bug Fixing
- Fixed ads x-axis position issue.
- Fix lost words of title "Sản phẩm thường được xem cùng" - https://jira.tiki.com.vn/browse/TAS-3718
- Discover similar products in an unsalable PDP - https://jira.tiki.com.vn/browse/TAS-3727.

## [Released] 1.0.27
- Implement new feature `Chat with seller` in PDP
- Fix bug crash in chat
- Implement DeliveryShipPromotionCampaign in PDP - This is a emergency task
- Implement UnsupportedMessageChatUI for chat in PDP

## [Released] 1.0.26
### Enhancements
- start adding test cases and integrate CI
- Create TikiNGON Hub Home Screen - https://jira.tiki.com.vn/browse/TAS-3693
- Create new Fresh Seller Store - https://jira.tiki.com.vn/browse/TAS-3694

### Bug Fixing
- Fixed ads x-axis position issue.
- Fix lost words of title "Sản phẩm thường được xem cùng" - https://jira.tiki.com.vn/browse/TAS-3718
- Discover similar products in an unsalable PDP - https://jira.tiki.com.vn/browse/TAS-3727.

## [Released] 1.0.25
- Fix crash by get wrong data for tracking Amplitude in PDP
- Re-utilize listing's image for PDP product image - [TAS-3988](https://jira.tiki.com.vn/browse/TAS-3988)
- Revamp Router - https://jira.tiki.com.vn/browse/AAR-80

## [Released] 1.0.24
- Test release again
- Fix crash because of using UIColor.random

## [Released] 1.0.23
- Test release again
- Fix crash because of using UIColor.random

## [Released] 1.0.22
- Test release again
- Fix crash because of using UIColor.random
- Show full content for TikiNow Description View
- Recommend user submit app review when they review product successfully - [TAS-4172](https://jira.tiki.com.vn/browse/TAS-4172)
- A/B - Add 'Write review' button to 'bought products' page - [TAS-4142](https://jira.tiki.com.vn/browse/TAS-4142)
- A/B - Make photo uploading button more prominent - [TAS-4159](https://jira.tiki.com.vn/browse/TAS-4159)
- Force login when user open cart - [TAS-4151](https://jira.tiki.com.vn/browse/TAS-4151)
- Add and update tracking data of ProductReview, ViewPDP, AddToCart event for Amplitude - [TAS-4176](https://jira.tiki.com.vn/browse/TAS-4176)

## [Released] 4.52.2
- Fix crash by get wrong data for tracking Amplitude in PDP
- Add logic for support tap gesture in the TikiNow/TikiPro icon into the ProductNameLabel
- Fix bug does not show icon `fastDelivery` in the `highlight_delivery` label
- Fix bug wrong left separator line in the ShippingDeliveryWidget

## [Released] 4.52.0
- Show Scheduled Delivery & Installation in PDP. - [TAS-4082](https://jira.tiki.com.vn/browse/TAS-4082)

## [Released] 4.51.1
- Hotfix crash in PDP by preLoad feature

## [Released] 4.51.0
- Re-utilize listing's image for PDP product image - [TAS-3988](https://jira.tiki.com.vn/browse/TAS-3988)
- Show Freeshipping badge (top highlight badge) - [TAS-4084](https://jira.tiki.com.vn/browse/TAS-4084)
- Fire pdp view & atc event to Amplitude - [TAS-4086](https://jira.tiki.com.vn/browse/TAS-4086)
- Update Listing Ux and UI - [TAS-4102](https://jira.tiki.com.vn/browse/TAS-4102)
- Show Best price badge - [TAS-4115](https://jira.tiki.com.vn/browse/TAS-4115)

## [Released] 4.50.0

* Cleanup unused remote config - https://jira.tiki.com.vn/browse/TAS-4025
* TAS-4028 Support query_refinements widget in listing pages
* Implement save coupon in PDP - https://jira.tiki.com.vn/browse/TAS-4035
* Adding 2 `product_review` tracking event  - https://jira.tiki.com.vn/browse/TAS-4038
* Log interactions with "frequently bought together" widget - https://jira.tiki.com.vn/browse/TAS-4061
* Implement Remote Config Live Loading - https://jira.tiki.com.vn/browse/TAS-4036
* Show TikiNow Banner in PDP - https://jira.tiki.com.vn/browse/TKN-318

## [Released] 4.49.0
* Revamp Router - https://jira.tiki.com.vn/browse/AAR-80
* Expose shipping fee's promo rules in PDP - https://jira.tiki.com.vn/browse/TAS-3984
* Remove old shipping estimation time UI
* Update TKWidget Response Model 
* Update logic show `giao nhanh` status in Listing and PDP to using badge code `leadtime`

## [Released] 4.48.4
* Implement new feature `Chat with seller` in PDP
* Fix bug crash in chat
* Implement DeliveryShipPromotionCampaign in PDP - This is a emergency task
* Implement UnsupportedMessageChatUI for chat in PDP
* Support send spid, mpid and sellerId for api load PromotionCampaign in PDP
* Move up the PromotionCampaign
* Check newMessage is existed in the list message or not to prevent duplicate UI

## Hotfixed 4.47.6
* Add personalization_strategy for PDP Personalization API.

## [Released] 4.47.0
* Move external frameworks / libraries to TKControlsLib.
* use /personalization/v2/pdp API for bottom widgets on PDP - https://jira.tiki.com.vn/browse/TAS-3755
* update product clicked - https://jira.tiki.com.vn/browse/TL-738
* Fix wrong mapping event in trackity

## [Released] 4.46.0
* Add TikiNGON breadcrumb - https://jira.tiki.com.vn/browse/TAS-3768
* Support bulkevents & source_screen_data - https://jira.tiki.com.vn/browse/TAS-3803
* Implement Product Video Demo in PDP - https://jira.tiki.com.vn/browse/TAS-3220
* Support TikiLIVE show mini player when having a livestream of viewing product - https://jira.tiki.com.vn/browse/TAS-3807
* Choose product variation in listing page - https://jira.tiki.com.vn/browse/TAS-3717
* Update logic show product comparison - https://jira.tiki.com.vn/browse/TAS-3826
* Update event view in PDP for Trackity

## [Released] 4.45.0
* Create TikiNGON Hub Home Screen - https://jira.tiki.com.vn/browse/TAS-3693
* Create new Fresh Seller Store - https://jira.tiki.com.vn/browse/TAS-3694
* Add Tracking events for TikiNGON Hub - https://jira.tiki.com.vn/browse/TAS-3714
* Handle deep link/universal link - https://jira.tiki.com.vn/browse/TAS-3699
* Create search fresh product screen - https://jira.tiki.com.vn/browse/TAS-3698
* Standardize add_to_cart tracking event - https://jira.tiki.com.vn/browse/TAS-3687.
* Standardize ecom_product_view tracking event - https://jira.tiki.com.vn/browse/TAS-3578.
* Fix lost words of title "Sản phẩm thường được xem cùng" - https://jira.tiki.com.vn/browse/TAS-3718
* Discover similar products in an unsalable PDP - https://jira.tiki.com.vn/browse/TAS-3727.

## [Released] 4.44.0
* Remove Tiki.Core local pod - https://jira.tiki.com.vn/browse/TAS-3594
* Add ActionDispatcherHandler to support call an action from other module
* Update logic AddToCart in PDP to using ActionDispatcherHandler
* Remove all `pdp_add_to_cart` event tracking for all intergrations
* Improve Shipping Info Widget & Expose shipping fee discount - https://jira.tiki.com.vn/browse/TAS-3600
* Customize PDP layout for FRESH Products - https://jira.tiki.com.vn/browse/TAS-3597
* Sending wrong S-SKU when firing add_to_cart tracking event to ANTs. - https://jira.tiki.com.vn/browse/TAS-3626
* A/B test - Turn off the Tikinow leadtime badging - https://jira.tiki.com.vn/browse/TAS-3567
* Fix memory leak for timer.
* Fix bug can not add to cart product has conflict min_sale rule and stock_quantity - https://jira.tiki.com.vn/browse/TAS-3659
* Fix memory leak for PDPviewmodel
* Show incorrectly discounted price in PDP when using coupon - https://jira.tiki.com.vn/browse/TAS-3671.
* Alert tracking event missing for important events - https://jira.tiki.com.vn/browse/TAS-3592

## [Released] 4.43.0
* Bug of 'Like' function of Q&A in PDP - https://jira.tiki.com.vn/browse/TAS-3510
* Bug of 'Like' product function in PDP - https://jira.tiki.com.vn/browse/TAS-3537
* Hide shipping info for unshippable categories - https://jira.tiki.com.vn/browse/TAS-3493
* Show location limitation awareness in seller page - https://jira.tiki.com.vn/browse/TAS-3498
* Update logic track PDP TTI - https://jira.tiki.com.vn/browse/TAS-3512
* Remove unused remote config - https://jira.tiki.com.vn/browse/TAS-3529
* Move WriteReview page into TKProductDetails module
* Handle universallink for the writeReview page - https://jira.tiki.com.vn/browse/TAS-3352
* Remove the WriteReviewV1 and its tracking event - https://jira.tiki.com.vn/browse/TAS-3549
* Add personalization_strategy for all personalization API - https://jira.tiki.com.vn/browse/TAS-3563

## Hotfix 4.42.3
* Force open some product ids in mweb

## [Released] 4.42.0
* Update domain for staging environment to point to www4 api
* Sending incorrectly param value to ANTs add_to_cart event. - https://jira.tiki.com.vn/browse/TAS-3460
* New shipping info widget in PDP - https://jira.tiki.com.vn/browse/TAS-3368
* Get shipping info for seller selecting page - https://jira.tiki.com.vn/browse/TAS-3383
* ANTS - Call both ImpUrl & trueImpUrl tracking when user see it. - https://jira.tiki.com.vn/browse/TAS-3164
* Try to fix crash in SelectedProductCell. Link: https://console.firebase.google.com/u/0/project/tikiandroid-1047/crashlytics/app/ios:vn.tiki.app.Tiki/issues/b18c59d826104bac3b6c88cf8c0de1d4
* Try to fix crash when configApplyCouponButton. Link: https://console.firebase.google.com/u/0/project/tikiandroid-1047/crashlytics/app/ios:vn.tiki.app.Tiki/issues/73ae6ffb314684975f3f2d63b72e6acc
* Try to fix crash when configBuyButton: Link: https://fabric.io/tiki/ios/apps/vn.tiki.app.tiki/issues/02d29b478ab5a807398b7ac36ea7ff4e
* Try to fix crash when setup NewCommentCell data. Link: https://console.firebase.google.com/u/0/project/tikiandroid-1047/crashlytics/app/ios:vn.tiki.app.Tiki/issues/b999a6d024b44fef68923acfba8d8757

## Hotfix 4.41.2
* Fix missing ANTs click tracking event in pdp

## Hotfix 4.41.1
* Try to fix crash in didSelectCellAt.... Link: https://console.firebase.google.com/u/0/project/tikiandroid-1047/crashlytics/app/ios:vn.tiki.app.Tiki/issues/4c843120216ae912d5d8ad99b10a97bd
* Try to fix crash in setProduct for TKAddToCartMessageCell. Link: https://console.firebase.google.com/u/0/project/tikiandroid-1047/crashlytics/app/ios:vn.tiki.app.Tiki/issues/1734d38f307940f5950a0974f72f9697

## [Released] 4.41.0
* Minimize image indicator in PDP - https://jira.tiki.com.vn/browse/TAS-3311
* Rename 'Sản phẩm tương tự' widget in PDP - https://jira.tiki.com.vn/browse/TAS-3340
* Apply new network layer - https://jira.tiki.com.vn/browse/AAR-21
* Optimize review listing - https://jira.tiki.com.vn/browse/TAS-3211

## [Released] 4.40.0
* Update logic define Remote Config key - https://jira.tiki.com.vn/browse/TAS-3290
* Expand fully product image - https://jira.tiki.com.vn/browse/TAS-3206
## [Released] 4.39.0
* Support debug tracking - https://jira.tiki.com.vn/browse/TAS-3105
* Turn off review photos on product image for specific category ids - https://jira.tiki.com.vn/browse/TAS-3166
* Bug fixed
```
https://jira.tiki.com.vn/browse/TAS-3104
https://jira.tiki.com.vn/browse/TAS-3176
https://jira.tiki.com.vn/browse/TAS-3186
https://jira.tiki.com.vn/browse/TAS-3148
```
