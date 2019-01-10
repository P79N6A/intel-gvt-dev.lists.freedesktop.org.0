Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1662059ywd;
        Thu, 10 Jan 2019 03:12:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4y5cPLPLMC9EMUBzUadvqelJY8mCn79NufY3KEL3cRct7E5PgeZVfx4Bh4JJlj5zDr5ebJ
X-Received: by 2002:a63:a064:: with SMTP id u36mr9044237pgn.145.1547118727638;
        Thu, 10 Jan 2019 03:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547118727; cv=none;
        d=google.com; s=arc-20160816;
        b=UeAB9LCRzt6UpA5htTZninTZ3ojvOaE92n5hC6WdkAj3+4myRRaXjFRxHL/oFNqgn2
         u6/KuL3doFNpxjsCul2C7SV78Ko0otXBWpRihuhlPfjUb5BVIGB9qDZJpGRvZJi/eBe3
         8rKcO5OewBBIJGT/j94gQ5UPt7VLizkDAMwWg7xpMhWyEYG6uZ21B5QIU2/sC6yq6q3e
         UYQGboahBjVkH9pKw6H3nuPvURseLvzEWjXreKhpIXEQz513mkwKE1D2ekAhEdrZYAcd
         8TeFNliOWj4p1SSQMZ2meLgagiCWdRXuf3JliGE3/6+Rif6AzuRFhR41joMG9Fp/+Wu1
         8Ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=LGVkXPXWd3DTCd/o45L23pF3lpcCaoktzPFO1c/MS00=;
        b=NEivjtP6VQmRD7RSwCH8kwBz1BIlp4zqPOz1dW5/48i0OtZHcvpH3/82aFqSZFEoNg
         YIVN31OvGDsTySPTXh6NhbcpSo6rKtmxC3eIJKMbY9liOGlLgQbrEaaWumvc9lYg3anW
         QUsR12y++wXWr8aD+5GXgmyQbCu/6k3HNAjc4E3orVfR7EOFnCVIdBtGoqfSuLKMEi/s
         SzsfEqk7m340XkKnPaA9EDT2DwPWshc3KTcdeUpx8NRQ4KU41GPRyZbwl3g/WrS+Y5KI
         XJcbxE8wbfWIYvR0GCsxMWfx2m0/k9CebMNZB/coQEw4WzbuoAvog5FdZMLr7QVxhzmA
         qgVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b14si5936385pfc.156.2019.01.10.03.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 03:12:07 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D1E6F2A8;
	Thu, 10 Jan 2019 11:12:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFFA6F2A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 11:12:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 03:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,461,1539673200"; d="scan'208";a="290468319"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2019 03:12:03 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/i915/gvt: add one VFIO graphics EDID region
Date: Thu, 10 Jan 2019 19:04:44 +0800
Message-Id: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
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
IGRhdGEuCgpIYW5nIFl1YW4gKDQpOgogIGRybS9pOTE1L2d2dDogYWRkIG9uZSBoeXBlcmNhbGwg
dG8gY2xlYW4gdmZpbyByZWdpb25zCiAgZHJtL2k5MTUvZ3Z0OiBhZGQgZnVuY3Rpb25zIHRvIGdl
dCByZXNvbHV0aW9uIGZyb20gaWQKICBkcm0vaTkxNS9ndnQ6IGFkZCBob3RwbHVnIGVtdWxhdGlv
bgogIGRybS9pOTE1L2d2dDogYWRkIFZGSU8gRURJRCByZWdpb24KCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZGlzcGxheS5jICAgfCAgMzEgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZGlzcGxheS5oICAgfCAgMzcgKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d2dC5jICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAg
ICAgICB8ICAgNCArKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oIHwgICAy
ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICB8IDEzMSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5o
ICAgICAgIHwgIDMxICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAg
ICAgIHwgIDEwICsrKwogOCBmaWxlcyBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
