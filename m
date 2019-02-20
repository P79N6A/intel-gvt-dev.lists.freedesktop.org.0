Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4200750ywa;
        Wed, 20 Feb 2019 00:48:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbAma5KFdJ7g+SIGpVThaj6Pz+8Jl0RVDdC2sVKS3qTQq09jWiUeVUgegB0J7LnhXY9crhK
X-Received: by 2002:a17:902:e48c:: with SMTP id cj12mr34363157plb.146.1550652484746;
        Wed, 20 Feb 2019 00:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550652484; cv=none;
        d=google.com; s=arc-20160816;
        b=XMTjwI7z6+zid58Xojp4PqXOaRZ5CiGyeQAQMNN5Nxn/IAr65cfIP7goUMCCP7ekAh
         PLBYIOtkuWLVXkbP+CMRUNeNUwVg9s9CQA5qoLQazT0vKEDdUS9l+X3pECsWQfFaXzYp
         U9s3OYY1/Z+jj/dFMEK291YiAJUvupAmLCRn/MWB1HReH2VQAS0t0IbV2VyO5xCh42eH
         jw1LSE1G/uSHZItz/6OsPySXzhktXhmjdWlUTX/IH3q5CiTKTADcffktxdP1foR6EZSI
         xwo7CedAIcFuT+JKx3YR/mWHuF/+N2OKsujkbCpRekw5B86y+T6pJS1FZLXNOwqxWVRV
         PN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=shfMu2AGle4z8XkV9dK8BXyfE6Id0uPPdY3ADcqo+iw=;
        b=RkaKd7SuthyVnt+pdM4eM6H7Bd1iwjEJVKHKhxbfZaKuJryklsUEc/BQqHGjgEpJXs
         W9IKuf6pvnbTdhtmA5KEfRFJTkARGex3jOdswNiskynsWohFFvwp9cm+lQtxEIf/CG19
         2gFIOvlpHnEpfY4FhFXSYzpk2zc9xWSch4W59qFAoRJjnJoMXH5MjIX/5ognqzbCt80n
         p4Nb9cLNsv7AfUagGMqWyj1tmrAdNaOBth5RaWETk0iR6H5pd2eiVUC52BNKNh32sol0
         nTdLKnm9bZgxPfsNLFRe9GlesWAWm+3ZrnzBN22YJmgEN4Pt0kjat/oeimRWE7J3TOan
         jUdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 23si18087011pgc.221.2019.02.20.00.48.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 00:48:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19B289165;
	Wed, 20 Feb 2019 08:48:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC35C8914D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 08:48:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70BDB41A5A;
 Wed, 20 Feb 2019 08:48:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37A318352;
 Wed, 20 Feb 2019 08:47:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1465411AB7; Wed, 20 Feb 2019 09:47:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] vfio/display: add xres + yres properties
Date: Wed, 20 Feb 2019 09:47:52 +0100
Message-Id: <20190220084753.9130-3-kraxel@redhat.com>
In-Reply-To: <20190220084753.9130-1-kraxel@redhat.com>
References: <20190220084753.9130-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 20 Feb 2019 08:48:01 +0000 (UTC)
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgY29uZmlndXJlIHRoZSBkaXNwbGF5IHJlc29sdXRpb24gd2hpY2ggdGhlIHZn
cHUgc2hvdWxkIHVzZS4KVGhlIGluZm9ybWF0aW9uIHdpbGwgYmUgcGFzc2VkIHRvIHRoZSBndWVz
dCB1c2luZyBFRElELCBzbyB0aGUgbWRldgpkcml2ZXIgbXVzdCBzdXBwb3J0IHRoZSB2ZmlvIGVk
aWQgcmVnaW9uIGZvciB0aGlzIHRvIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBody92ZmlvL3BjaS5oICAgICB8ICAyICsrCiBody92
ZmlvL2Rpc3BsYXkuYyB8IDE2ICsrKysrKysrKysrKysrLS0KIGh3L3ZmaW8vcGNpLmMgICAgIHwg
IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5oIGIvaHcvdmZpby9wY2kuaAppbmRleCBiMWFlNGMw
NzU0Li5jMTFjM2YxNjcwIDEwMDY0NAotLS0gYS9ody92ZmlvL3BjaS5oCisrKyBiL2h3L3ZmaW8v
cGNpLmgKQEAgLTE0OSw2ICsxNDksOCBAQCB0eXBlZGVmIHN0cnVjdCBWRklPUENJRGV2aWNlIHsK
ICNkZWZpbmUgVkZJT19GRUFUVVJFX0VOQUJMRV9JR0RfT1BSRUdJT04gXAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoMSA8PCBWRklPX0ZFQVRVUkVfRU5BQkxFX0lHRF9PUFJFR0lP
Tl9CSVQpCiAgICAgT25PZmZBdXRvIGRpc3BsYXk7CisgICAgdWludDMyX3QgZGlzcGxheV94cmVz
OworICAgIHVpbnQzMl90IGRpc3BsYXlfeXJlczsKICAgICBpbnQzMl90IGJvb3RpbmRleDsKICAg
ICB1aW50MzJfdCBpZ2RfZ21zOwogICAgIE9mZkF1dG9QQ0lCQVIgbXNpeF9yZWxvOwpkaWZmIC0t
Z2l0IGEvaHcvdmZpby9kaXNwbGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwppbmRleCBlZDJlYjE5
ZWEzLi43YjliNjA0YTY0IDEwMDY0NAotLS0gYS9ody92ZmlvL2Rpc3BsYXkuYworKysgYi9ody92
ZmlvL2Rpc3BsYXkuYwpAQCAtNDYsOCArNDYsOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlf
ZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLAogICAgIHFlbXVf
ZWRpZF9pbmZvIGVkaWQgPSB7CiAgICAgICAgIC5tYXh4ICA9IGRweS0+ZWRpZF9yZWdzLT5tYXhf
eHJlcywKICAgICAgICAgLm1heHkgID0gZHB5LT5lZGlkX3JlZ3MtPm1heF95cmVzLAotICAgICAg
ICAucHJlZnggPSBwcmVmeCwKLSAgICAgICAgLnByZWZ5ID0gcHJlZnksCisgICAgICAgIC5wcmVm
eCA9IHByZWZ4ID86IHZkZXYtPmRpc3BsYXlfeHJlcywKKyAgICAgICAgLnByZWZ5ID0gcHJlZnkg
PzogdmRldi0+ZGlzcGxheV95cmVzLAogICAgIH07CiAKICAgICBkcHktPmVkaWRfcmVncy0+bGlu
a19zdGF0ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX0RPV047CkBAIC0xMTcsNiArMTE3
LDEwIEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURldmljZSAq
dmRldikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19SRUdJT05fU1VC
VFlQRV9HRlhfRURJRCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRweS0+
ZWRpZF9pbmZvKTsKICAgICBpZiAocmV0KSB7CisgICAgICAgIGlmICh2ZGV2LT5kaXNwbGF5X3hy
ZXMgfHwgdmRldi0+ZGlzcGxheV95cmVzKSB7CisgICAgICAgICAgICB3YXJuX3JlcG9ydCgidmZp
bzogbm8gZWRpZCBzdXBwb3J0IGF2YWlsYWJsZSwgIgorICAgICAgICAgICAgICAgICAgICAgICAg
InhyZXMgYW5kIHlyZXMgcHJvcGVydGllcyBoYXZlIG5vIGVmZmVjdC4iKTsKKyAgICAgICAgfQog
ICAgICAgICByZXR1cm47CiAgICAgfQogCkBAIC0xMjgsNiArMTMyLDE0IEBAIHN0YXRpYyB2b2lk
IHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURldmljZSAqdmRldikKICAgICBwcmVhZF9m
aWVsZChmZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBtYXhfeXJlcyk7CiAgICAg
ZHB5LT5lZGlkX2Jsb2IgPSBnX21hbGxvYzAoZHB5LT5lZGlkX3JlZ3MtPmVkaWRfbWF4X3NpemUp
OwogCisgICAgLyogaWYgeHJlcyArIHlyZXMgcHJvcGVydGllcyBhcmUgdW5zZXQgdXNlIHRoZSBt
YXhpbXVtIHJlc29sdXRpb24gKi8KKyAgICBpZiAoIXZkZXYtPmRpc3BsYXlfeHJlcykgeworICAg
ICAgICB2ZGV2LT5kaXNwbGF5X3hyZXMgPSBkcHktPmVkaWRfcmVncy0+bWF4X3hyZXM7CisgICAg
fQorICAgIGlmICghdmRldi0+ZGlzcGxheV95cmVzKSB7CisgICAgICAgIHZkZXYtPmRpc3BsYXlf
eXJlcyA9IGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJlczsKKyAgICB9CisKICAgICB2ZmlvX2Rpc3Bs
YXlfZWRpZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwgMCk7CiAgICAgcmV0dXJuOwogCmRpZmYgLS1n
aXQgYS9ody92ZmlvL3BjaS5jIGIvaHcvdmZpby9wY2kuYwppbmRleCBkZDEyZjM2MzkxLi5lZGI4
Mzk0MDM4IDEwMDY0NAotLS0gYS9ody92ZmlvL3BjaS5jCisrKyBiL2h3L3ZmaW8vcGNpLmMKQEAg
LTMxODIsNiArMzE4Miw4IEBAIHN0YXRpYyBQcm9wZXJ0eSB2ZmlvX3BjaV9kZXZfcHJvcGVydGll
c1tdID0gewogICAgIERFRklORV9QUk9QX1NUUklORygic3lzZnNkZXYiLCBWRklPUENJRGV2aWNl
LCB2YmFzZWRldi5zeXNmc2RldiksCiAgICAgREVGSU5FX1BST1BfT05fT0ZGX0FVVE8oImRpc3Bs
YXkiLCBWRklPUENJRGV2aWNlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc3BsYXks
IE9OX09GRl9BVVRPX09GRiksCisgICAgREVGSU5FX1BST1BfVUlOVDMyKCJ4cmVzIiwgVkZJT1BD
SURldmljZSwgZGlzcGxheV94cmVzLCAwKSwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInlyZXMi
LCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3lyZXMsIDApLAogICAgIERFRklORV9QUk9QX1VJTlQz
MigieC1pbnR4LW1tYXAtdGltZW91dC1tcyIsIFZGSU9QQ0lEZXZpY2UsCiAgICAgICAgICAgICAg
ICAgICAgICAgIGludHgubW1hcF90aW1lb3V0LCAxMTAwKSwKICAgICBERUZJTkVfUFJPUF9CSVQo
IngtdmdhIiwgVkZJT1BDSURldmljZSwgZmVhdHVyZXMsCi0tIAoyLjkuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
