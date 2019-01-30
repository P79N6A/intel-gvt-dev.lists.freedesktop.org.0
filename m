Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp5411463ywd;
        Wed, 30 Jan 2019 02:33:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN66JrniGdKDUfskwxxVBV/SwyDZ1ROlVFi0TwCf+a1V+YWs72VwD5Kj2yxysTQqlQDKQmQI
X-Received: by 2002:a17:902:e28e:: with SMTP id cf14mr30370566plb.311.1548844417047;
        Wed, 30 Jan 2019 02:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548844417; cv=none;
        d=google.com; s=arc-20160816;
        b=nZerxWfx4Usr/KMrZBZeaRlTy78cfYpU+E40zhYP7MGzVirR5YtGF5pBJvkOHh66IR
         yNA+Q766utO5mZzvxsxjGdGlnpEsa/8QDE+gSqq7UobSOUslsQW7tWQ4CQBN0py2WoCC
         0CUeTMQSx7lpQBPjFxBDIWFVx2+fk653IDNDLUW7iJK2T4RPeA3kMzREYTY9ldHL+yL7
         pMuzzWZ0ccou10NGVe1pR/w7EOoXyJPOEzWbT9M8a0DIjHhT1XU2xUYcOWGMAMrSQLe1
         pa+OKCGiy7ryAdkWjFa3DveKUV9Pk/ll9h5xQ5Wfkf3YlWg+rU8MZvsrO1KMbyaK33g1
         3DTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=KhmWthi8uP0Wy12cPizO+EvFOBb7RrRoP8FulHis7l8=;
        b=jfAsfCrpojJ0oQKm+9HH85Z449xClvUDAbTnSaxpGdgzr+SYpqzrqWqZstbYQb9pGJ
         xas/In2e7jKLBSU4pt9+4uZw4O56UXrxh8EOCxpcWISjv6+QHzTsaUZmTG3rbfiTCdxz
         gcSiaj1+mvyqcauBSibjzsXt0wzxT4kw6Lc00qVGPbSbJK0j4iUjBomEUxJ77T1tnQjV
         ZbcF55Da8iDKDHuxOfYg3DalKXDDE4YeTBHXV6em2+w6H656Fm3EbKyxqaiW17H6NeCm
         TzXSq7W8myFUH/oy3YtTWqYYYGKtKpcGtlGRZLo1gv0rUiHbIpoihdhpYGzPG8UY7K/T
         ML8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 204si1056304pga.383.2019.01.30.02.33.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 02:33:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C356E16B;
	Wed, 30 Jan 2019 10:33:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F676E16B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Jan 2019 10:33:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2019 02:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,540,1539673200"; d="scan'208";a="110993029"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2019 02:33:33 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/i915/gvt: add functions to get default resolution
Date: Wed, 30 Jan 2019 18:25:52 +0800
Message-Id: <1548843954-4622-2-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
References: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
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

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKVGhlc2UgZnVuY3Rp
b25zIHdpbGwgZ2V0IGRlZmF1bHQgcmVzb2x1dGlvbiBhY2NvcmRpbmcgdG8gdmdwdSB0eXBlLgoK
U2lnbmVkLW9mZi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZGlzcGxheS5oIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jCmluZGV4IDRmMjViNmIuLjZhODZmYWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYwpAQCAtMzQyLDYgKzM0Miw3IEBAIHN0YXRpYyBp
bnQgc2V0dXBfdmlydHVhbF9kcF9tb25pdG9yKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQg
cG9ydF9udW0sCiAJcG9ydC0+ZHBjZC0+ZGF0YV92YWxpZCA9IHRydWU7CiAJcG9ydC0+ZHBjZC0+
ZGF0YVtEUENEX1NJTktfQ09VTlRdID0gMHgxOwogCXBvcnQtPnR5cGUgPSB0eXBlOworCXBvcnQt
PmlkID0gcmVzb2x1dGlvbjsKIAogCWVtdWxhdGVfbW9uaXRvcl9zdGF0dXNfY2hhbmdlKHZncHUp
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaAppbmRleCBlYTdjMWM1Li5hODdmMzNlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmgKQEAgLTE0NiwxOCArMTQ2LDE5IEBAIGVudW0g
aW50ZWxfdmdwdV9wb3J0X3R5cGUgewogCUdWVF9QT1JUX01BWAogfTsKIAorZW51bSBpbnRlbF92
Z3B1X2VkaWQgeworCUdWVF9FRElEXzEwMjRfNzY4LAorCUdWVF9FRElEXzE5MjBfMTIwMCwKKwlH
VlRfRURJRF9OVU0sCit9OworCiBzdHJ1Y3QgaW50ZWxfdmdwdV9wb3J0IHsKIAkvKiBwZXIgZGlz
cGxheSBFRElEIGluZm9ybWF0aW9uICovCiAJc3RydWN0IGludGVsX3ZncHVfZWRpZF9kYXRhICpl
ZGlkOwogCS8qIHBlciBkaXNwbGF5IERQQ0QgaW5mb3JtYXRpb24gKi8KIAlzdHJ1Y3QgaW50ZWxf
dmdwdV9kcGNkX2RhdGEgKmRwY2Q7CiAJaW50IHR5cGU7Ci19OwotCi1lbnVtIGludGVsX3ZncHVf
ZWRpZCB7Ci0JR1ZUX0VESURfMTAyNF83NjgsCi0JR1ZUX0VESURfMTkyMF8xMjAwLAotCUdWVF9F
RElEX05VTSwKKwllbnVtIGludGVsX3ZncHVfZWRpZCBpZDsKIH07CiAKIHN0YXRpYyBpbmxpbmUg
Y2hhciAqdmdwdV9lZGlkX3N0cihlbnVtIGludGVsX3ZncHVfZWRpZCBpZCkKQEAgLTE3Miw2ICsx
NzMsMzAgQEAgc3RhdGljIGlubGluZSBjaGFyICp2Z3B1X2VkaWRfc3RyKGVudW0gaW50ZWxfdmdw
dV9lZGlkIGlkKQogCX0KIH0KIAorc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgdmdwdV9lZGlk
X3hyZXMoZW51bSBpbnRlbF92Z3B1X2VkaWQgaWQpCit7CisJc3dpdGNoIChpZCkgeworCWNhc2Ug
R1ZUX0VESURfMTAyNF83Njg6CisJCXJldHVybiAxMDI0OworCWNhc2UgR1ZUX0VESURfMTkyMF8x
MjAwOgorCQlyZXR1cm4gMTkyMDsKKwlkZWZhdWx0OgorCQlyZXR1cm4gMDsKKwl9Cit9CisKK3N0
YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHZncHVfZWRpZF95cmVzKGVudW0gaW50ZWxfdmdwdV9l
ZGlkIGlkKQoreworCXN3aXRjaCAoaWQpIHsKKwljYXNlIEdWVF9FRElEXzEwMjRfNzY4OgorCQly
ZXR1cm4gNzY4OworCWNhc2UgR1ZUX0VESURfMTkyMF8xMjAwOgorCQlyZXR1cm4gMTIwMDsKKwlk
ZWZhdWx0OgorCQlyZXR1cm4gMDsKKwl9Cit9CisKIHZvaWQgaW50ZWxfZ3Z0X2VtdWxhdGVfdmJs
YW5rKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCk7CiB2b2lkIGludGVsX2d2dF9jaGVja192Ymxhbmtf
ZW11bGF0aW9uKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCk7CiAKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
