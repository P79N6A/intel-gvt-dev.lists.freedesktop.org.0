Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp184025ywo;
        Tue, 23 Apr 2019 22:50:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlVSVDwXfK0gIwotGyJV/aP5mK6yxEeq3S29wtWsPFVdDEMsmTFIXY7A2EaG0x9gIpZGx6
X-Received: by 2002:a63:a18:: with SMTP id 24mr27707148pgk.332.1556085019210;
        Tue, 23 Apr 2019 22:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556085019; cv=none;
        d=google.com; s=arc-20160816;
        b=by7M8C8L2un7z4Q/RiLMSx6ABMNEfpy9YyWRiMBfrAi0lc/aqErteUQDAqc4rl1XKS
         SiLDikxDoL6cedMhR7NF5fZbuzIRMGstKvqtfnYvUnSLO0oiILKSa/IJe+ad9oKD1olf
         6iAmx/iUu1qsgrJkwnw7hHzHF9HZbeD0ioE5cp21tsdbbXt/DKun2V4kCmTBLr/VeCOs
         FJG7EZJjGwsVR7rablbQqKeeSfqbdhXA2cpRBKZODmLKdkar+EtKnDwpp3AIghUScBuU
         LlEnzCGZN0tvxANCLGyLvMjJvDrI8UCePtH/pPLUJHAIYlN1sW+vtuSH8mhM+8ibghyp
         hi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=b1wKy2lw85jESRnq7hIr63RrRlKvc7IDZGbAZFxfaFY=;
        b=E46INHt4s4MB2EVpmA9pjo4r6ogYG2/ZFCvhIolxh/4D9b8V7yfKTE71gZowvPEIlI
         H1bmjdpfhPoL7GQaW+WZANa1cyz/7wpiBxPqIVd+FnMQQLkdwNujwUo8dYTkljNk0TFl
         9wTI6X5q3Q1Y1UCAnH5HmDWw16w8vvhP41mY3V5ivnHXj5LIZ90xIU618pGAYDihTFI3
         Fm74OUqFE9VnP3ra9NyvXyfPWuo3vy8GLug7XBhF1Tjl/ISMymf2yVHcpQo7DDHrn71x
         JZUjdoSQZoiBjr4NV5XVHQzMAm5IzmoQS45JZjcP5IGNTRUzMyQyqdm4+MNtKM0GT7Qz
         VtPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q18si17558596pls.319.2019.04.23.22.50.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 22:50:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D0896E9;
	Wed, 24 Apr 2019 05:50:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D505896E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 05:50:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 22:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="143140722"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2019 22:50:16 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/gvt: add 0x4dfc to gen9 save-restore list
Date: Wed, 24 Apr 2019 01:44:40 -0400
Message-Id: <20190424054440.8167-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190424054305.8054-1-yan.y.zhao@intel.com>
References: <20190424054305.8054-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

MHg0ZGZjIGlzIGluLWNvbnRleHQgbW1pbyBmb3IgZ2VuOSssIGJ1dCBlYWNoIHZtIGhhdmUgZGlm
ZmVyZW50IHNldHRpbmdzCm5lZWQgdG8gYWRkIGl0IHRvIHNhdmUtcmVzdG9yZSBsaXN0IGFsb25n
IHdpdGggb3RoZXIgdHJ0dCByZWdpc3RlcnMKClNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4u
eS56aGFvQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250
ZXh0LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwppbmRleCBlZTBkNTZlZDViMzAuLjBiNmU5Njk0YjY4
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwpAQCAtMTE0LDYgKzEx
NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZW5naW5lX21taW8gZ2VuOV9lbmdpbmVfbW1pb19saXN0W10g
X19jYWNoZWxpbmVfYWxpZ25lZCA9IHsKIAl7UkNTMCwgVFJJTlZUSUxFREVUQ1QsIDAsIHRydWV9
LCAvKiAweDRkZWMgKi8KIAl7UkNTMCwgVFJWQURSLCAwLCB0cnVlfSwgLyogMHg0ZGYwICovCiAJ
e1JDUzAsIFRSVFRFLCAwLCB0cnVlfSwgLyogMHg0ZGY0ICovCisJe1JDUzAsIF9NTUlPKDB4NGRm
YyksIDAsIHRydWV9LAogCiAJe0JDUzAsIFJJTkdfR0ZYX01PREUoQkxUX1JJTkdfQkFTRSksIDB4
ZmZmZiwgZmFsc2V9LCAvKiAweDIyMjljICovCiAJe0JDUzAsIFJJTkdfTUlfTU9ERShCTFRfUklO
R19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIwOWMgKi8KLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
