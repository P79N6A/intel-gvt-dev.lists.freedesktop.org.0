Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746316ywo;
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwowyIVQWkbNrbp545T/2p2WWg1ChUnrG3z8IyET2p7ZOUBF5NO1s8JmSRVefX7WlK60JQc
X-Received: by 2002:a65:5549:: with SMTP id t9mr35239036pgr.388.1554979652460;
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979652; cv=none;
        d=google.com; s=arc-20160816;
        b=EioX+TSTEl0YPS4blbqHyg0YVbFxuQfJD4g6dWfIdoCfitXC44KKbI99WgP1HjAf7X
         +GKo6DS/+vl2Hmy06vssPZq0S+3Jkv3QL4Xk3qpGxlg79UwwbTCng89GxezTYHk5LMhj
         tPN2HW4uAseXo9u8fzJY/rsNUODlGwKFVywsFkKhzpWG87u32MlF8N3jcQJFtJfqYjo0
         zWA+ZT3pk+wZkZwiI2zFD+MOdeImz8j+GNbDefeS4Jxzg58zxNGY18QV60bLQcvb/ovO
         lkkg3aL0RVuKyNQWzvrWSN5GhIuobEMRag1xvy2COnkHFYw4GARtJzTmoqANZnz9tz8K
         Qlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=ZPliDPTbiLv9T8XSxugEPdFtVtzO1D/awzBM7uKSrGM=;
        b=jf2d/n0Z+mfNVcoQbrLnZWW8Fj4SAXQYXuql1VnI/4+JWcu5nT21GTcr9EgijXKxxf
         995i3iplTyaP3TVhDlPO90fb3iwl9mLkd3QVXud8DSLU/WEG7WkLrfUBieaHCGMXYHmf
         f8x/J5tq2Y7iKS7UJ+F+3jJ3kylgVOk7ljvR4qRF352aOVi3uaNgRC9yNfzsBW15+LU7
         lcO9a3ZtgdOa9wqpdRum66qduwUzBWkaNlvh0/dFuYASMyEL+qt57h9ia31hbBnGWEjo
         yJ7gokrNFae6O7+ec9FXiEtj8HMLQlSpamF+k483kzmBE/VwZKAJInryMhm2QHGFgrOg
         O5mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id q25si32952673pgv.534.2019.04.11.03.47.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186BC897E8;
	Thu, 11 Apr 2019 10:47:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040C897E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715297"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:30 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 5/6] drm/i915/gvt: Assign NULL to the pointer after memory
 free.
Date: Thu, 11 Apr 2019 13:46:30 +0300
Message-Id: <20190411104631.7627-6-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGNvbXBsYWlucyBhYm91dCB1c2luZyBw
b2ludGVyIGFmdGVyCmJlaW5nIGZyZWVkLCBiZWNhdXNlIGZ1cnRoZXIgd2UgcGFzcyBpdCB0byB0
aGUgZ3Z0X3ZncHVfZXJyKCkgZnVuY3Rpb24uCkFzc2lnbiBwb2ludGVyIHRvIGJlIE5VTEwgaW50
ZW50aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUgY29kZQphbmFseXplci4KClRo
aXMgcGF0Y2ggZml4ZWQgdGhlIGlzc3VlICM2NDggcmVwb3J0ZWQgYXMgZXJyb3IgYnkga2xvY3dv
cmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tp
aUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CkNj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKaW5kZXggZTQ0ZGRiMzI4YjRiLi45NWNkOGYyNWQ2ZjkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKQEAgLTExMDAsNiArMTEwMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxf
dmdwdV9wcGd0dF9zcHQgKnBwZ3R0X3BvcHVsYXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKIAogZXJy
X2ZyZWVfc3B0OgogCXBwZ3R0X2ZyZWVfc3B0KHNwdCk7CisJc3B0ID0gTlVMTDsKIGVycjoKIAln
dnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5IDB4JWxseCB0eXBl
ICVkXG4iLAogCQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7Ci0tIAoyLjE3LjEKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAw
MDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWlj
aWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVu
ZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGll
bnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
