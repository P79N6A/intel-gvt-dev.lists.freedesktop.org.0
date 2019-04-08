Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3027786ywo;
        Sun, 7 Apr 2019 22:57:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFA5hWGC8fkFON8ufNUODZCjYISHva9S70ksoUTVRr2t5qvaTIl1kz/rSKulggl66qFpEO
X-Received: by 2002:a62:6444:: with SMTP id y65mr27795046pfb.56.1554703077579;
        Sun, 07 Apr 2019 22:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554703077; cv=none;
        d=google.com; s=arc-20160816;
        b=QwSULfU7VeDPdFW76Xp7LhrtW+MHwJ13MY2nDVuCX+dDUL4YmXytf4bRxkuWzokhLU
         /nPgSukH2gcgiNEPrKQWG8Y5CYXvh/PzeV97qlTDA9Ta8FPes3mSAYGGa8fzGECxUCRM
         /46IOLjjXhJ/NWgGfO7+qxJWI7yKNYMBavLayUn+y7F/j8sYixxH0waHAUsUwK6Yy0Us
         BsCjhf90U+NqXJZlfpMEcYmpjov4SYeJDiPrJ/RMdKyptDiV01s/zcmBW9rViKBt5+Zl
         rZu2VPQKqRMh9NapKKloJMZ6p31iHqSRrKY/Lnp86mNK4EAChcWfx9/NntXav+tZ4YY6
         JKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=z6tiD9+Jlr2Vs3DwZwZm+q3xN/MGayBosvyYW34eaVo=;
        b=MLgW7UkvMY5HVhzAOky6w3uSbg+l+B2iVAYkSo5XCCgaOGlvQ22eCarEjxbaoadc2k
         YZddpfiywcADYCw/BXNkPqbaqFz+j8B0Rji38eIrRBEIwPL3+NMguzLYLuPJM/xsgKz1
         6MuJGAu8HSJ6bNBcKsD+s6DKn3raYTjH4epCprfL4iI7sOIduso8m8VfZpbOWERkiFPX
         PtobP9bWd2uh7FdgsfJg3wkDbtPhrqGbc0lS2nfSEyr66trr3DN0TnOq3ogdEY6gbvV9
         aXN61XR1NCNNDUdDc17kT+4z+N1QTw4QjygxQXaGOOcN1XcbTDmov/jxWhHBNSJqOoPT
         v4rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i93si26230893plb.189.2019.04.07.22.57.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 22:57:57 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD6389272;
	Mon,  8 Apr 2019 05:57:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946989272
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 05:57:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 22:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="148923496"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2019 22:57:54 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/gvt: Check if cur_pt_type is valid
Date: Mon,  8 Apr 2019 08:55:01 +0300
Message-Id: <20190408055502.8474-4-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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

U3RhdGljIGNvZGUgYW5hbHl6ZXIgd2FybnMgdGhhdCBpbmRleCB2YWx1ZSBmb3Igc2NyYXRjaF9w
dCBtYXkgYmUgZXF1YWwKdG8gLTEuIEluZGV4IHZhbHVlIHR5cGUgaXMgaW50ZWxfZ3Z0X2d0dF90
eXBlX3QsIHNvIGl0IG1heSBiZSBhbnkgbnVtYmVyCmF0IHJhbmdlIC0xIHRvIDE3LiBDaGVjayBm
aXJzdCBpZiBjdXJfcHRfdHlwZSBhbmQgY3VyX3B0X3R5cGUrMSBpcyB2YWxpZAp2YWx1ZXMuCgpU
aGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWFsIGlzc3VlICM0MjIgcmVwb3J0ZWQgYnkga2xvY3dv
cmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tp
aUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CkNj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKaW5kZXggOGRjYjYyMjNiOTg1
Li43ZGMwOWIzODllNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTkzNiw3ICs5MzYsMTQg
QEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50cnkoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsCiAKIAlpZiAoZS0+dHlwZSAhPSBHVFRfVFlQRV9QUEdUVF9ST09U
X0wzX0VOVFJZCiAJCSYmIGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkg
ewotCQljdXJfcHRfdHlwZSA9IGdldF9uZXh0X3B0X3R5cGUoZS0+dHlwZSkgKyAxOworCQljdXJf
cHRfdHlwZSA9IGdldF9uZXh0X3B0X3R5cGUoZS0+dHlwZSk7CisKKwkJaWYgKCFndHRfdHlwZV9p
c19wdChjdXJfcHRfdHlwZSkgfHwKKwkJCQkhZ3R0X3R5cGVfaXNfcHQoY3VyX3B0X3R5cGUgKyAx
KSkKKwkJCXJldHVybiAtRUlOVkFMOworCisJCWN1cl9wdF90eXBlICs9IDE7CisKIAkJaWYgKG9w
cy0+Z2V0X3BmbihlKSA9PQogCQkJdmdwdS0+Z3R0LnNjcmF0Y2hfcHRbY3VyX3B0X3R5cGVdLnBh
Z2VfbWZuKQogCQkJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5s
YW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5l
c3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRo
aXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1h
dGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55
IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRo
ZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
