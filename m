Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3027805ywo;
        Sun, 7 Apr 2019 22:57:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGkl+B8LCZnFATixWWV2Vp9Vul9Mg902us7iIKpKVmDQSMaN0oXhFTDEmr03INjYH8DGlE
X-Received: by 2002:a63:c45:: with SMTP id 5mr26804507pgm.385.1554703079095;
        Sun, 07 Apr 2019 22:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554703079; cv=none;
        d=google.com; s=arc-20160816;
        b=EP5521fZ2F/ncvo07RJb37mA+VZYkaxcZsvu+zohPCukHJpXingd+Txs+gnl9/YCpT
         zHWDgm957nqiccOHcYWgVNxGHfABMS8rFIkcjMV33ZZEShRq3McOGHBvzYMulY3KqvgN
         N4FLLioa6U6dqCcFz35y9ylwHjeSz4TvO/TnR1NTbmFFmfX7qEeUM9GurX3Nk0MZzSWG
         u9DNNs5BWXX6aOlFYbRhoPD1wm3cb8wQFGgDNOg8Yuz350GVXb65M/zVRluuMCS2U6oF
         BUQkQNjXTt0MxYnhj0qzFpGR+usofRRBZwlHX4MOooo7woOfC7rzc+P1YgIFg1XZfF4q
         t2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=hnqpuaohRdwl9xmgMWuYzx88CmzxePRMtnWEi3YLLOs=;
        b=MR5J7KLUb55KY5q/sMQPWlExb2qjWH8TGSYH+5uRaQfRCpXPKwU+iJhCQ6+MDi6P3e
         fG8avTpyCvqdoVJYMMcdi3mpvlz8fCT/DsUPJCO4E30BLXqRBxE9bACEsEWWXkvF6Bgx
         hYyR0oxjWrHxI/FMCT23UIFWz8gmxs4mVQKKTh2bnYRVNjucBi0VKBjdEdUniYh4bms3
         nZDLFTlb+vl7gVAuRKxJRTx0mKVe5DR2GeSMoAMnP3qAUI7ezfY5fApZcgNgGPUYqo7D
         C7dg5Qq8JwQzCnNuhvLNZkrQyVamnVPQ9q4Owmn7DKPe2oZ3Hp3ts9O5u1Ao/5i8+J4j
         QY9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id r198si27042110pgr.153.2019.04.07.22.57.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 22:57:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44F089274;
	Mon,  8 Apr 2019 05:57:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25E689274
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 05:57:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 22:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="148923502"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2019 22:57:56 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/gvt: Assign NULL to the pointer after memory
 free.
Date: Mon,  8 Apr 2019 08:55:02 +0300
Message-Id: <20190408055502.8474-5-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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
aTkxNS9ndnQvZ3R0LmMKaW5kZXggN2RjMDliMzg5ZTU5Li4zY2YzOTg0YWFlNDEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKQEAgLTEwOTgsNiArMTA5OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxf
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
