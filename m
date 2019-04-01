Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1719011ywo;
        Sun, 31 Mar 2019 23:13:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0FYO3fJKEG0zxbnoEwrgSXoS+LiOW2hF6XMVxTdqxkXgsA/HG4bjkgKxmXsd9Eh025kd7
X-Received: by 2002:a62:ed08:: with SMTP id u8mr60694164pfh.200.1554099239437;
        Sun, 31 Mar 2019 23:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554099239; cv=none;
        d=google.com; s=arc-20160816;
        b=GhV4TWbUWBTk4sppMylS0egWybpy2Y9BH3oWQBKHM26p719UvJrzAd6oMd1iPoazrI
         P9ahoDx25PClxBjy2EVobRXNF+g3ME366Jeg35NVu2ZnQW+3eg5SMPNajYCj01YNKpHa
         cCf55E2yfhG/32UTBNPXcp/dWZc41OMwjmZZYBIyofPekbCFDE0skGamo47TdNqsXtMX
         MjDJKLbN42aGO2lhXtYMqAJHA7UMr2IKTOBARky1rPfFj6S5MTwfrmXV1M9NNt+oRYz+
         KPU7yhk044LG0WfdYSsiWFQQxsNi4xYgJs1DJfAnvxkS9siL8DKZWnPnW70ZTw3mG2ou
         y+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=MJ7VrjSujaRszwUUFjJSvKu338RGs3x0kCyFfzYfUsY=;
        b=Ss0otKHIIzCFVzQNhuR5iLv6gZ0M6WKKBkmxkwlCcxYuZ6h5Cirj9NxJvB7VJwj1df
         vvfQkzXFXvLwRNQlWPJ2g59QkwMu9WFbRQ+niRUEQGoI5MK0EJwCukUYA2fkT4X24NKR
         zAXfTwwgDIUa0trQJfaiVCHfS4fkUBLjeeA2MQPvOkuckFWZyjNqfHu9eXcUNyaacI9S
         jcoFdmv4eSXCLs/kd8BBfEop/84ld3J4Kc8cwJqwksrH/DnmEwBDKkWYSYLYWut/NT7G
         8Vqy1UaMAxQ4TzxFCpwbCyIwvSIRSgYbabbIEdALUQPV9cxNxwHydw0qRhukEruSSV+p
         flYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t26si7962183pgu.504.2019.03.31.23.13.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Mar 2019 23:13:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F26E079;
	Mon,  1 Apr 2019 06:13:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531BA6E079
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Apr 2019 06:13:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Mar 2019 23:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,295,1549958400"; d="scan'208";a="157017764"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.24])
 by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2019 23:13:56 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in gen8/9
 mmio list
Date: Mon,  1 Apr 2019 14:13:53 +0800
Message-Id: <20190401061353.17886-1-colin.xu@intel.com>
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
UFUgY29udGV4dCBzd2l0Y2giKQoKdjI6ClJlYmFzZSB0byBsYXRlc3QgZ3Z0LXN0YWdpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pb19jb250ZXh0LmMKaW5kZXggNzY2MzBmYmU1MWI2Li5lN2UxNGM4NDJiZTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKQEAgLTY4LDcgKzY4LDcgQEAgc3RhdGlj
IHN0cnVjdCBlbmdpbmVfbW1pbyBnZW44X2VuZ2luZV9tbWlvX2xpc3RbXSBfX2NhY2hlbGluZV9h
bGlnbmVkID0gewogCXtCQ1MwLCBSSU5HX01JX01PREUoQkxUX1JJTkdfQkFTRSksIDB4ZmZmZiwg
ZmFsc2V9LCAvKiAweDIyMDljICovCiAJe0JDUzAsIFJJTkdfSU5TVFBNKEJMVF9SSU5HX0JBU0Up
LCAweGZmZmYsIGZhbHNlfSwgLyogMHgyMjBjMCAqLwogCXtCQ1MwLCBSSU5HX0hXU1RBTShCTFRf
UklOR19CQVNFKSwgMHgwLCBmYWxzZX0sIC8qIDB4MjIwOTggKi8KLQl7QkNTMCwgUklOR19FWEND
KEJMVF9SSU5HX0JBU0UpLCAweDAsIGZhbHNlfSwgLyogMHgyMjAyOCAqLworCXtCQ1MwLCBSSU5H
X0VYQ0MoQkxUX1JJTkdfQkFTRSksIDB4ZmZmZiwgZmFsc2V9LCAvKiAweDIyMDI4ICovCiAJe1JD
UzAsIElOVkFMSURfTU1JT19SRUcsIDAsIGZhbHNlIH0gLyogVGVybWluYXRlZCAqLwogfTsKIApA
QCAtMTE5LDcgKzExOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZW5naW5lX21taW8gZ2VuOV9lbmdpbmVf
bW1pb19saXN0W10gX19jYWNoZWxpbmVfYWxpZ25lZCA9IHsKIAl7QkNTMCwgUklOR19NSV9NT0RF
KEJMVF9SSU5HX0JBU0UpLCAweGZmZmYsIGZhbHNlfSwgLyogMHgyMjA5YyAqLwogCXtCQ1MwLCBS
SU5HX0lOU1RQTShCTFRfUklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIwYzAgKi8K
IAl7QkNTMCwgUklOR19IV1NUQU0oQkxUX1JJTkdfQkFTRSksIDB4MCwgZmFsc2V9LCAvKiAweDIy
MDk4ICovCi0Je0JDUzAsIFJJTkdfRVhDQyhCTFRfUklOR19CQVNFKSwgMHgwLCBmYWxzZX0sIC8q
IDB4MjIwMjggKi8KKwl7QkNTMCwgUklOR19FWENDKEJMVF9SSU5HX0JBU0UpLCAweGZmZmYsIGZh
bHNlfSwgLyogMHgyMjAyOCAqLwogCiAJe1ZDUzEsIFJJTkdfRVhDQyhHRU44X0JTRDJfUklOR19C
QVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MWMwMjggKi8KIAotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
