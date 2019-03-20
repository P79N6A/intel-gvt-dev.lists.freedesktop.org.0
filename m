Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp126534ywb;
        Tue, 19 Mar 2019 18:09:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHk7PvJ4MtVJNNzmwpXFYy6SR+X1NgeheuYull1qMBfNBufzpm2AY+C1tn2QsgdL+4LIy7
X-Received: by 2002:a63:d70a:: with SMTP id d10mr4616471pgg.286.1553044181207;
        Tue, 19 Mar 2019 18:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553044181; cv=none;
        d=google.com; s=arc-20160816;
        b=bgg5ItyD7bzF00LEgc3MiR/9omsYQvSyZiTL6cIpbo/xF625E+k1t9PVn5bhQ3koRr
         DyE1+6v6rqZJhPSQ4KPbWMVazgcRvm8rYWq5D9KMY4loU4YuUJRt8Ed16aoM5x9+2Mv7
         RIfn1vdVWXPX7GjwSy6lqzEaEKU/0Dqg2QQhNOOweYGIoc0wzpS+Z3VnmXoSDXcBpXT+
         WwIkhdJTe6IbSpqhOm6SxjRjwsbQTWntMqmO81bz192D+Nhm/mvi7OQAQ6y45AMC858k
         WMKGz1At29u+9gBxF8wSrazd5WxsyxbB4a4y7+o/WVeWLdTqxs8Eq1W0FfhKsez7zHK/
         88pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=1Ybzv0LI+Q4lJUQczKppHgOqn3/wAVT5x2wnf2waNk8=;
        b=Xe2wNKsRGV/wE2jKVgkq9+5RVuNXYIzCbmHxFN30i0iTa/leAjIfEkdUbkeGeMj60T
         wTTRSrKIE8ktjp9cZDRuFxivIvRUDKUcgUk9R5p4hqikx0OIWqDIX/acuYTbZcePikls
         eRC/WiRlieEFdaPEEnGl4bfsX6rfb13hLnZDR2Sw1LeRjlIS2h4CGrMVLfKwzNmEesAi
         Ixug3Ip5jG2maLXTfYdngietkpX+LPiSh/ommg1L3fDFPNahxlB8k77bzasCJFHZHDCP
         XBT25s3+zh59/bskn81ynrZgwGsEuoHAplGyUWCHwuFkpd+4FJgiMR5cN9WUhGugSgkm
         T5Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id o15si335096pgv.435.2019.03.19.18.09.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 18:09:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826AF89BCD;
	Wed, 20 Mar 2019 01:09:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3CD89BCD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 01:09:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 18:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="143459798"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2019 18:09:37 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in gen8/9
 mmio list
Date: Wed, 20 Mar 2019 09:09:34 +0800
Message-Id: <20190320010934.5431-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIEdGWCBQUk0gb24gMDEub3JnLCBiaXQgMzE6MTYgb2YgbW1pbyAweDIyMDI4
IHNob3VsZCBiZSBtYXNrcy4KCkZpeGVzOiAxNzg2NTcxMzkzMDcgKCJkcm0vaTkxNS9ndnQ6IHZH
UFUgY29udGV4dCBzd2l0Y2giKQoKU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCmluZGV4IDhhMmY2ZTlkMjI1Ny4u
ZWE4NjEzNWFlZWIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19j
b250ZXh0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCkBA
IC02OCw3ICs2OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZW5naW5lX21taW8gZ2VuOF9lbmdpbmVfbW1p
b19saXN0W10gX19jYWNoZWxpbmVfYWxpZ25lZCA9IHsKIAl7QkNTMCwgUklOR19NSV9NT0RFKEJM
VF9SSU5HX0JBU0UpLCAweGZmZmYsIGZhbHNlfSwgLyogMHgyMjA5YyAqLwogCXtCQ1MwLCBSSU5H
X0lOU1RQTShCTFRfUklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIwYzAgKi8KIAl7
QkNTMCwgUklOR19IV1NUQU0oQkxUX1JJTkdfQkFTRSksIDB4MCwgZmFsc2V9LCAvKiAweDIyMDk4
ICovCi0Je0JDUzAsIFJJTkdfRVhDQyhCTFRfUklOR19CQVNFKSwgMHgwLCBmYWxzZX0sIC8qIDB4
MjIwMjggKi8KKwl7QkNTMCwgUklOR19FWENDKEJMVF9SSU5HX0JBU0UpLCAweGZmZmYsIGZhbHNl
fSwgLyogMHgyMjAyOCAqLwogCXtSQ1MwLCBJTlZBTElEX01NSU9fUkVHLCAwLCBmYWxzZSB9IC8q
IFRlcm1pbmF0ZWQgKi8KIH07CiAKQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgc3RydWN0IGVu
Z2luZV9tbWlvIGdlbjlfZW5naW5lX21taW9fbGlzdFtdIF9fY2FjaGVsaW5lX2FsaWduZWQgPSB7
CiAJe0JDUzAsIFJJTkdfTUlfTU9ERShCTFRfUklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8q
IDB4MjIwOWMgKi8KIAl7QkNTMCwgUklOR19JTlNUUE0oQkxUX1JJTkdfQkFTRSksIDB4ZmZmZiwg
ZmFsc2V9LCAvKiAweDIyMGMwICovCiAJe0JDUzAsIFJJTkdfSFdTVEFNKEJMVF9SSU5HX0JBU0Up
LCAweDAsIGZhbHNlfSwgLyogMHgyMjA5OCAqLwotCXtCQ1MwLCBSSU5HX0VYQ0MoQkxUX1JJTkdf
QkFTRSksIDB4MCwgZmFsc2V9LCAvKiAweDIyMDI4ICovCisJe0JDUzAsIFJJTkdfRVhDQyhCTFRf
UklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIwMjggKi8KIAogCXtWQ1MxLCBSSU5H
X0VYQ0MoR0VOOF9CU0QyX1JJTkdfQkFTRSksIDB4ZmZmZiwgZmFsc2V9LCAvKiAweDFjMDI4ICov
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
