Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp957965ywb;
        Sun, 10 Mar 2019 19:38:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4zVLEyi4l1evPHS+95EalOSY4ZI9lgoVY5cS54osIga8ZYQ3JnXJHtxddxWdlXDfufmM5
X-Received: by 2002:a62:64d1:: with SMTP id y200mr30813426pfb.161.1552271903047;
        Sun, 10 Mar 2019 19:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552271903; cv=none;
        d=google.com; s=arc-20160816;
        b=mRALg/s0s2QZ5l/lAkVOo7Z0q4zagdnt+gQLKug5eMnz/SBTZ27sWn8jQTjSnj8VV1
         886q9f47JJvtUlI5p8sEsk8kaMCSUS3FyYRDI1svHQhzqjx/DsDgCXlZsFNrLXReGhsv
         rxrb5z9z8x4+JPiR8ImAPGfYumJVamAeVhFTiyh7hjxMjZT+i2QXydPcWd6Ldc6rjQMd
         xFx4yDq0T84Nruj/LSGEcwW8EdrDEtztoT2dS0scU5qMhCRZeuK8oPZlS3Ukjx1pEm/E
         342U9A064Rny+G9nfYO0T6UcdGEC++EWJQH0SyBWWkkrLVA4v7CVdZcISF77S9fG8xpa
         LUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=XaVL0QU4F98Gi19Zm/wOoiyv4q+rqmgpG99a9kbVAQM=;
        b=TD4eiynAqGD7JvSP3vicfu8qVcOOK3dwUuZigZ+F01niIqqwXep6eiw8yvFVYFb6w8
         Lcz+1xTgW0dE8Oh6Y7b20VPawaianOgWKV/QrSlyVGJgzNnskb+i9y9lDwqHBnmjNooU
         DtWaMYY4Xs8tHkmKAeyu71EkFvIt4C9hNK9+IFtA9aelsZbUP1SHFY3q8EsGqCvI93Kg
         yvxbKmUD91zGptRcIqxSTBMMnhB2F1cO6/Pt187AJ3KETTdKnnp8meEnbII+9sS+krEI
         tb5mahPbSehdlCQfY3K5zDbAVFELIheF01PkrpqNpCqhab+wo+0y8rdeJzkCdBnCW9eB
         UXZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a18si3867538pgw.82.2019.03.10.19.38.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 19:38:23 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90839896AF;
	Mon, 11 Mar 2019 02:38:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F370896AF;
 Mon, 11 Mar 2019 02:38:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 19:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="153812378"
Received: from debian-nuc.sh.intel.com ([10.239.160.36])
 by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2019 19:38:20 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: always pin hw_id for GVT context
Date: Mon, 11 Mar 2019 10:37:47 +0800
Message-Id: <20190311023747.1426-1-zhenyuw@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW5pdGlhbGx5IGZvdW5kIGlzc3VlIHdpdGggY2xvc2VkIGNvbnRleHQgZGVidWcgY2hlY2sgd2hl
biBwaW4KaHdfaWQgZm9yIEdWVCBjb250ZXh0LCBsb29rcyB3ZSBzaG91bGQgYWx3YXlzIHBpbiBo
d19pZCBmb3IgdGhhdAphcyBHVlQgY29udGV4dCBpcyBmaXhlZCBmb3IgZWFjaCB2R1BVIGxpZmUg
Y3ljbGUsIGFuZCB3ZSdkIGFsc28KbGlrZSB0byBnZXQgcGlubmVkIGh3X2lkIGUuZyBmb3IgcGVy
ZiByZWFzb24sIGV0Yy4KCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYyB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
Z2VtX2NvbnRleHQuYwppbmRleCBiOWYzMjE5NDc5ODIuLmYzMzkxN2ViYWJlNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fY29udGV4dC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYwpAQCAtNTA2LDYgKzUwNiwxMyBAQCBpOTE1
X2dlbV9jb250ZXh0X2NyZWF0ZV9ndnQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlpZiAoSVNf
RVJSKGN0eCkpCiAJCWdvdG8gb3V0OwogCisJcmV0ID0gaTkxNV9nZW1fY29udGV4dF9waW5faHdf
aWQoY3R4KTsKKwlpZiAocmV0KSB7CisJCWNvbnRleHRfY2xvc2UoY3R4KTsKKwkJY3R4ID0gTlVM
TDsKKwkJZ290byBvdXQ7CisJfQorCiAJY3R4LT5maWxlX3ByaXYgPSBFUlJfUFRSKC1FQkFERik7
CiAJaTkxNV9nZW1fY29udGV4dF9zZXRfY2xvc2VkKGN0eCk7IC8qIG5vdCB1c2VyIGFjY2Vzc2li
bGUgKi8KIAlpOTE1X2dlbV9jb250ZXh0X2NsZWFyX2Jhbm5hYmxlKGN0eCk7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
