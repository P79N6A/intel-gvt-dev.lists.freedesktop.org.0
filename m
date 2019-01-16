Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp465444ywd;
        Wed, 16 Jan 2019 03:52:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN73XsYUjks3x2jI3H5lX6oYR+G0H5pAgVC7pThcaOtz/h3dxz+RX6CEJGRYJRfEN4ZVAGV5
X-Received: by 2002:a62:44d8:: with SMTP id m85mr9477429pfi.164.1547639527162;
        Wed, 16 Jan 2019 03:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547639527; cv=none;
        d=google.com; s=arc-20160816;
        b=xvYIoqoagB7LOuJ0Mdt39xMj7K4y4jX5+bYtcDcRg87vqyMWYFe6nsDTTwKRJM7EgW
         eXL5WbqjDqwu8BDH876McuRKAze6BIFcILtBX9i9MbB4T6S7ZqWFHJW4rVc/Nf+crw3x
         BDNKOqxwgc4Lcmc3YVOJ7hISYg+SZOdDv7IesTV0emBPnjwYNWf9es67pgEkTJfQ84Cr
         wVjFpmEF2ywNKmRT/XVy4c3xRrNZxfvZYGg2f/RvnJ4/s5Nu3buJKEt7kaGaOJJ2czIn
         hg/y16HFwbDyz9twqtfndhQ0bp2Uz8SfKbAmBVOCm3xMIISQlgHi+eTwpZWv/Qg8NaRV
         0NBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=W+wPi+56V1lfm1iKe0HZhBy5NVknH9mJ/lPaQASI2kI=;
        b=DbZVnHLJsPwCOlt2cL463xTipRkjaQDwqvLagdN9rQHuk0E7+P6LQAB6y9TZW0RG9T
         yfVCOdIyk5DaVqNaByaUhVAyyOjUyLNFn5z+QOOZ0UH+pK1Cq/XBPOSLnnEjn3EDZ3LW
         H6grDhC2mW3mmqIJv+qBrovvnUnME40R7PeCDFfzcu8Hy4XJf7aeudECxjkX1N357EwP
         eWQho8pPwCOYb4/+TNerGHCk5sfW2Evva8tq1qtMeIirt8P0m8WUDBGj3FYvfUdutqy7
         33jZ8AdMPAq012T3M2WyIFCrHb908hSqBSQFbXHfPa0pFA85cAMLmQcd4Q5onQPKZX3F
         C9Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id s4si5781282plr.306.2019.01.16.03.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 03:52:07 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3E6F015;
	Wed, 16 Jan 2019 11:52:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8D6F012
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 16 Jan 2019 11:52:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 03:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,485,1539673200"; d="scan'208";a="126475170"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga002.jf.intel.com with ESMTP; 16 Jan 2019 03:52:02 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/i915/gvt: add VFIO graphics EDID region support
Date: Wed, 16 Jan 2019 19:44:24 +0800
Message-Id: <1547639067-5181-1-git-send-email-hang.yuan@linux.intel.com>
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

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKQWRkIG9uZSBWRklP
IGdyYXBoaWNzIEVESUQgcmVnaW9uIGZvciB2Z3B1LiBXaGVuIHRoZSByZWdpb24gaXMgdXBkYXRl
ZCwKaG90cGx1ZyBldmVudCBpcyBlbXVsYXRlZCBmb3IgZ3Vlc3QgdG8gZ2V0IG5ldyBFRElEIGRh
dGEuCgp2MjogcmV0dXJuIGVycm9yIGluIGludmFsaWQgRURJRCByZWdpb24gdXBkYXRlIDxaaGVu
eXU+CgpIYW5nIFl1YW4gKDMpOgogIGRybS9pOTE1L2d2dDogYWRkIGZ1bmN0aW9ucyB0byBnZXQg
ZGVmYXVsdCByZXNvbHV0aW9uCiAgZHJtL2k5MTUvZ3Z0OiBhZGQgaG90cGx1ZyBlbXVsYXRpb24K
ICBkcm0vaTkxNS9ndnQ6IGFkZCBWRklPIEVESUQgcmVnaW9uCgogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2Rpc3BsYXkuYyAgIHwgIDMxICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2Rpc3BsYXkuaCAgIHwgIDM3ICsrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3Z0LmMgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAg
ICAgIHwgICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggfCAgIDEg
KwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgIHwgMTE5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0Lmgg
ICAgICAgfCAgMTcgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgICB8
ICAgNiArKwogOCBmaWxlcyBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2Cg==
