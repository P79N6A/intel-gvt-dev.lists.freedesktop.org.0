Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp496376ywo;
        Thu, 18 Apr 2019 04:06:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw53QLWXutW3o9ZUkXhnVOQazn5rLmCPsdafW+VEobEQbypN5S3RdOAIXKVmwQ/xaiSA9oV
X-Received: by 2002:a17:902:7d91:: with SMTP id a17mr5440741plm.338.1555585592473;
        Thu, 18 Apr 2019 04:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555585592; cv=none;
        d=google.com; s=arc-20160816;
        b=vTOsY96m0LBsCRli5erKpmwj+MphIeMfKqZTEBoz4eplfldsLD/KZyRIY/l7hR369x
         oUcC+ZePp3oyHsCg/LGuIYuCXi2+5icHySreZwgka7oAV7ZS3EIO6IHJh0akMmbdXbQm
         Pc7qAGJkmyV+nsf1+xXJHYzXJX40QK/cJbRVPMXyXsyGTR9PPVzdGrvcKZypOKRWX3UZ
         5M0Y38fODwD8wRxp/LdSLe41NAQ8ny1lzb8VC+yC/aofvbv6FF+tZUXJKShpwlFr7ZKb
         qCdPe0e/scwAFnpm0RBY1oLdtEfjCRXSNJR1PXFvwDr/nN7QbgvbHp/ke1onigrt+T9f
         P4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=HGVJaRkWRBgyiBZivduzbjxo7oI5pNLIfJLrIfZnvjQ=;
        b=rWCw9lD3EaaZuApOrOUROrIpNNvx1LLYzHI3kCVHoQb35pCHjBkRyM4Tx0R7bKHTHI
         dtup9W83/0WoMQDWIx1ZNagPfDjiFKWuiyyhb1D4afHgoW16js3BYdMzCjxiKAsETw7O
         Z17Z67sfKD2salQspG0cpZQ45HPmsS2CftMz7xr+mcEBDZ9M+1GFwynULTe0BixiUdzR
         RmBzrMXJpAcocUG+QtI8YtPANpCZavKzsSWCNzJkX/9OCgWQwFOxMM9wkRkc83HYuEbc
         kYOx8fqOMDQSnoqU4je4Jjzn1lEK8y+JJ+KpOlXYVjXbB3RsSL+Pe/NF4UwL9sZ5vCGl
         tXcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=canonical.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v5si1893663pfm.134.2019.04.18.04.06.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2019 04:06:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=canonical.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA456E0FE;
	Thu, 18 Apr 2019 11:06:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792456E050;
 Thu, 18 Apr 2019 11:06:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hH4s3-00016S-CW; Thu, 18 Apr 2019 11:06:23 +0000
From: Colin King <colin.king@canonical.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: fix spelling mistake "resseting" -> "resetting"
Date: Thu, 18 Apr 2019 12:06:22 +0100
Message-Id: <20190418110622.11452-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIGd2dF9kYmdfY29yZSBkZWJ1ZyBtZXNzYWdlLiBGaXgg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Zn
cHUuYwppbmRleCA0NGNlM2MyYjlhYzEuLmQxZTgxOGYyYjUyMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jCkBAIC01MzMsNyArNTMzLDcgQEAgdm9pZCBpbnRlbF9ndnRfcmVzZXRfdmdwdV9sb2Nr
ZWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wgZG1sciwKIAlpbnRlbF9lbmdpbmVfbWFz
a190IHJlc2V0dGluZ19lbmcgPSBkbWxyID8gQUxMX0VOR0lORVMgOiBlbmdpbmVfbWFzazsKIAog
CWd2dF9kYmdfY29yZSgiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
XG4iKTsKLQlndnRfZGJnX2NvcmUoInJlc3NldGluZyB2Z3B1JWQsIGRtbHIgJWQsIGVuZ2luZV9t
YXNrICUwOHhcbiIsCisJZ3Z0X2RiZ19jb3JlKCJyZXNldHRpbmcgdmdwdSVkLCBkbWxyICVkLCBl
bmdpbmVfbWFzayAlMDh4XG4iLAogCQkgICAgIHZncHUtPmlkLCBkbWxyLCBlbmdpbmVfbWFzayk7
CiAKIAl2Z3B1LT5yZXNldHRpbmdfZW5nID0gcmVzZXR0aW5nX2VuZzsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
