Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1478078ywd;
        Wed, 23 Jan 2019 21:54:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4LKgv2eHIQ+FtuJzE6qHMqNzrBYzOjVZJ0HeVs9AoWgoVYyc0mYBovS9OwDYG9zpwaWPwu
X-Received: by 2002:a17:902:4681:: with SMTP id p1mr5413647pld.184.1548309245249;
        Wed, 23 Jan 2019 21:54:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548309245; cv=none;
        d=google.com; s=arc-20160816;
        b=ItNbum6f/GQQebeietN0KwYkZr0G4SmT9XBZLhpqrEdCGFFgQd/P2NOrt+R7JKFCb8
         MVEbSu9W+Bel9SO2ZTZzccfcjdY7NfVqXUrPKkBHTHaqCYtXFodzgYM1pJqwTD1Tdhnm
         Bd4uhPifb1Cgt2b2e0RGyp0h8u8u9XfNRnRBxqnsyrOwoQwLrDRBrTs5S+8pnbauD4Ok
         gs+cg+zq5bzh6kdrzcehYJoi+pb5usxc1400YeiPNeL39EtY+10qa7US+7S0qqQ98qCq
         rbhzm+uGu7aqq89+08t6tIu0Ua2/GuOGDj6R1Xj/U3quXlsywF82KSvccXPSkH6nPoYG
         u+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=O+bGgmnEZvXMW2G53d065+Tag67JyDZPyjehJXyKqcQ=;
        b=QtolsTCT0RZjWavtq5SklQyDrNKvNoZPF4qVGm/mIwp1kuuf9+YSq6pMtmKCmc+RIR
         iOltr1kh2jUrMuz0dYaQRyz0kZhjSiqVbGeTgfN8yusLBlaI8iWfbrZFQaOQouojl+os
         VQt/EgkAkHnjWfcCM4ZnZV5BBLmwnQd2Oc3+aCtK0kGvjWywbdqs4pEhlALEYjC2U4Of
         GEa6w3420BzJrNOzp0z+j0R5ZkLTDjbE/p/g/S8iCz5HI5x1m2tvIJFKhAIR9fjlTfl8
         kjNCB2eWJ0dGpS15NAdlFRaMLSMaib+3GpFEtJ9zbM9DpiWBh3Pkq/xjeTEF4+pUS4NK
         PSCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j29si14591562pgm.554.2019.01.23.21.54.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Jan 2019 21:54:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03A16F098;
	Thu, 24 Jan 2019 05:54:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4A26F098
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Jan 2019 05:54:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 21:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,514,1539673200"; d="scan'208";a="269450327"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga004.jf.intel.com with ESMTP; 23 Jan 2019 21:54:02 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/i915/gvt: add VFIO graphics EDID region
Date: Thu, 24 Jan 2019 13:46:34 +0800
Message-Id: <1548308797-3109-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKQ3JlYXRlIG9uZSBW
RklPIGdyYXBoaWNzIEVESUQgcmVnaW9uIGZvciB2Z3B1LiBXaGVuIHRoZSByZWdpb24gaXMgdXBk
YXRlZCwKaG90cGx1ZyBldmVudCBpcyBlbXVsYXRlZCBmb3IgZ3Vlc3QgdG8gZ2V0IG5ldyBFRElE
IGRhdGEuCgp2MjogYWRkIEVESUQgYmxvYiBzYW5pdHkgY2hlY2sgYW5kIHN1cHBvcnQgRURJRCBz
aXplIHVwZGF0ZSA8emhlbnl1PgoKSGFuZyBZdWFuICgzKToKICBkcm0vaTkxNS9ndnQ6IGFkZCBm
dW5jdGlvbnMgdG8gZ2V0IGRlZmF1bHQgcmVzb2x1dGlvbgogIGRybS9pOTE1L2d2dDogYWRkIGhv
dHBsdWcgZW11bGF0aW9uCiAgZHJtL2k5MTUvZ3Z0OiBhZGQgVkZJTyBFRElEIHJlZ2lvbgoKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgICB8ICAzMSArKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaCAgIHwgIDM3ICsrKysrKysrLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3Z0LmggICAgICAgfCAgMTAgKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlw
ZXJjYWxsLmggfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgIHwg
MTM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvbXB0LmggICAgICAgfCAgMTcgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC92Z3B1LmMgICAgICB8ICAgNiArKwogOCBmaWxlcyBjaGFuZ2VkLCAyMzUgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
