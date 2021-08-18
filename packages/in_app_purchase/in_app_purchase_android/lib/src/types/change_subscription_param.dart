// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../../billing_client_wrappers.dart';
import 'types.dart';

/// This parameter object for upgrading or downgrading an existing subscription.
class ChangeSubscriptionParam {
  /// Creates a new change subscription param object with given data
  ChangeSubscriptionParam({
    required this.oldProductId,
    required this.oldServerVerificationData,
    this.prorationMode,
  });

  /// Creates a new change subscription param object from a [GooglePlayPurchaseDetails]
  factory ChangeSubscriptionParam.fromPurchaseDetails(
    /// The purchase object of the existing subscription that the user needs to
    /// upgrade/downgrade from.
    GooglePlayPurchaseDetails oldPurchaseDetails,
    ProrationMode? prorationMode,
  ) {
    return ChangeSubscriptionParam(
      oldProductId: oldPurchaseDetails.productID,
      oldServerVerificationData: oldPurchaseDetails.verificationData.serverVerificationData,
      prorationMode: prorationMode,
    );
  }

  ///The product id of the previously purchased product
  final String oldProductId;
  ///The token given in the [PurchaseDetails] [VerificationData].serverVerificationData.
  final String oldServerVerificationData;

  /// The proration mode.
  ///
  /// This is an optional parameter that indicates how to handle the existing
  /// subscription when the new subscription comes into effect.
  final ProrationMode? prorationMode;
}
