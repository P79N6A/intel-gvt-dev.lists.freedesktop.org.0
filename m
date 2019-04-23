Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3352049ywo;
        Tue, 23 Apr 2019 05:05:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/2jdq7Lh5ME6DMkz3rKD6MYoJMhKAcJvpwSq7Fc/p3Z6FpAXdvNrs0l6qT1oG3x9g+zkC
X-Received: by 2002:a62:4d43:: with SMTP id a64mr26181986pfb.174.1556021145787;
        Tue, 23 Apr 2019 05:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021145; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKmd2PAe3v859toxtPjNHLizM7+YBg+qSvx/5BMb5tLK2Q6/jLzfugi5X5mhCJdito
         4yO9EXB/qKxD4BbMXAz349SiEgXYnXyIL5RIMekHyRLNjDS9RKdhMHbJwAiPIFvFhAGC
         w80mRzNnbEvkAxK921pmMAkl2uTR8/R7RxvYTFOnk2LwBIIXe5Rvcd6Ku4pbFk4EGRgb
         6WwV6T9Ec5A7Z8C0AvHlD689wglmWVJr59rZBFqYs+hkRYl9HAuU8uUYWVI8jmJhnkUn
         LJCW/DK0Ntqdr7MJVcVjmGVaMsy1+FycwvZSon2jJ7W7wIOT5/VMF/faRD/eAcKYlYTP
         365A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=lUdBZiUo4UqLTpKhYMSdEcA97IO86oheBt9MwQE/tPU=;
        b=F1/XTSueY1YKEyp/tHMqfYgZdr1wByAj6ZWpGc9SNMFzc2+V5j0xnoFLpIvSxGZt5S
         tjzBpij8dNK3+v4vbhRMono+fqZN6ESF+GTFVNogxidGHDw6W4I++3zHx8To9p3DEuHv
         GxBb+WI/60Q7XJR6pwF9PFn67n1Jl3H1g2sY35K0zW872ErQVTL7Yz/OQj5goGVwM3T6
         OO1R9MT1DQds+ity6MeE2uxzvAxaDN8qy77wBqWKf672VDSQ5/uWbsKWK9tSKYFfY0Dw
         yKPAJCZqLwua+J2qNuujcBme0//vU29ONiUl5Om70MnEBkupEC0XxZwiJEWYErFvIdDD
         +YEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id u125si16987490pfb.112.2019.04.23.05.05.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653D489322;
	Tue, 23 Apr 2019 12:05:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BA989322
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002252"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:42 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/i915/gvt: Check if get_next_pt_type() always
 returns a valid value
Date: Tue, 23 Apr 2019 15:04:13 +0300
Message-Id: <20190423120413.30929-7-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
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
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIGd0dF90eXBlX3RhYmxlW10gZnVuY3Rpb24gZ2V0X25leHRfcHRfdHlwZSgp
IG1heSByZXR1cm5zCkdUVF9UWVBFX0lOVkFMSUQgaW4gc29tZSBjYXNlcy4gVG8gcHJldmVudCBk
cml2ZXIgdG8gdHJ5IHRvIGNyZWF0ZSBtZW1vcnkKcGFnZSB3aXRoIGludmFsaWQgZGF0YSB0eXBl
LCBhZGRpdGlvbmFsIGNoZWNrIGlzIGFkZGVkLgoKU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1i
aXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpDYzogWmhlbnl1IFdhbmcgPHpo
ZW55dXdAbGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29t
PgpDYzogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCA5Mjc3NTNhNTlhMWUuLmEzZmE3YzZmMWI5YiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMTA4NSw2ICsxMDg1LDkgQEAgc3RhdGljIHN0cnVjdCBp
bnRlbF92Z3B1X3BwZ3R0X3NwdCAqcHBndHRfcG9wdWxhdGVfc3B0X2J5X2d1ZXN0X2VudHJ5KAog
CX0gZWxzZSB7CiAJCWludCB0eXBlID0gZ2V0X25leHRfcHRfdHlwZSh3ZS0+dHlwZSk7CiAKKwkJ
aWYgKCFndHRfdHlwZV9pc19wdCh0eXBlKSkKKwkJCWdvdG8gZXJyOworCiAJCXNwdCA9IHBwZ3R0
X2FsbG9jX3NwdF9nZm4odmdwdSwgdHlwZSwgb3BzLT5nZXRfcGZuKHdlKSwgaXBzKTsKIAkJaWYg
KElTX0VSUihzcHQpKSB7CiAJCQlyZXQgPSBQVFJfRVJSKHNwdCk7Ci0tIAoyLjE3LjEKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4
MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxl
ZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQs
IHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
