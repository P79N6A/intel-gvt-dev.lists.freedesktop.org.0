Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3352019ywo;
        Tue, 23 Apr 2019 05:05:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybp4Uia53Yr730hbMO54QFF+q3yLb5r4qfxVCdZEz3Nv9W8FlVLB+w1rnUkCAkPxuD3hOi
X-Received: by 2002:a62:69c2:: with SMTP id e185mr26314598pfc.119.1556021144544;
        Tue, 23 Apr 2019 05:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021144; cv=none;
        d=google.com; s=arc-20160816;
        b=SBsdNOfzeFFJQ1VYzHWCUFb73neyKRoclg85k6owS7+rZ/QDZY93a2c/gw9Cenm7zx
         qIUzzyRdJdXb7R6qjHgwHTNuUTwQqhNK2f3XArFBEX6nY7MhQ0crR3hMfeDLip56q+xd
         RWAhdu/IBEGk64SECthIbFAEEsCyh1puk7vhlH/s9aqIz/8plCXkCIjuL8D1LjaFgPDh
         8knfpjDXDXtheuuWBHFY5PccQUyviWaIM6u1Tw8aW3c5mxUIC3ADny1sFJkNzxdp/Tww
         cVkPnOEIRRoscGph6wXN22jxYvaN8fiPzIxs1x2IdKGQZt4DfZjjwFNROnaNRGmHwslq
         z/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=6QK77yWmS+ionezdSNu0Tz3xGvrJOcDkip6rArn0Igg=;
        b=fNv7FmuHr9XIsCX2rPvPbxYTuBSk/vAc4Tfbox8C7tW49lviQPh25murtcrCzxZFUA
         VU7WVgZFZsxi3T0mPqkGDzlfoq6OwO5JwVUeo54WhXIWRy114x5tSU5lKvJDGfQpfGIf
         vD5Vqd1sU4PwtUs9O5QGA5h0mvm2ojC9jcynvRnXMZp0/SwrHOc+Pl2Cl1JlOK5fxCpm
         UnPSjtCC1fDUn4R/ENUvErqaAkVLMbv4ssw39Bw1WfaQjpVH1ADYezmhKcXMQdWGrXmO
         2+oLZeQd9wqg84Rv/sw3Lw44RUrwDi7Ib+XZdKL4bKG+RTC50UuCeAehPOsp++u1Cfei
         +Wzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w34si7990333pla.250.2019.04.23.05.05.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2C89316;
	Tue, 23 Apr 2019 12:05:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182889316
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002247"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:41 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer after memory
 free.
Date: Tue, 23 Apr 2019 15:04:12 +0300
Message-Id: <20190423120413.30929-6-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGNvbXBsYWlucyBhYm91dCB1c2luZyBw
b2ludGVyIGFmdGVyCmJlaW5nIGZyZWVkLCBiZWNhdXNlIGZ1cnRoZXIgd2UgcGFzcyBpdCB0byB0
aGUgZ3Z0X3ZncHVfZXJyKCkgZnVuY3Rpb24uCkFzc2lnbiBwb2ludGVyIHRvIGJlIE5VTEwgaW50
ZW50aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUgY29kZQphbmFseXplci4KClRo
aXMgcGF0Y2ggZml4ZWQgdGhlIGlzc3VlICM2NDggcmVwb3J0ZWQgYXMgZXJyb3IgYnkga2xvY3dv
cmsuCgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tp
aUBpbnRlbC5jb20+CkNjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+CkNj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKaW5kZXggMDYxNDk5YTM4ZjRkLi45Mjc3NTNhNTlhMWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKQEAgLTExMDYsNiArMTEwNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxf
dmdwdV9wcGd0dF9zcHQgKnBwZ3R0X3BvcHVsYXRlX3NwdF9ieV9ndWVzdF9lbnRyeSgKIAogZXJy
X2ZyZWVfc3B0OgogCXBwZ3R0X2ZyZWVfc3B0KHNwdCk7CisJc3B0ID0gTlVMTDsKIGVycjoKIAln
dnRfdmdwdV9lcnIoImZhaWw6IHNoYWRvdyBwYWdlICVwIGd1ZXN0IGVudHJ5IDB4JWxseCB0eXBl
ICVkXG4iLAogCQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7Ci0tIAoyLjE3LjEKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAw
MDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWlj
aWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVu
ZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGll
bnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
