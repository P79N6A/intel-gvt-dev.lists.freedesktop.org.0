Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp183540ywo;
        Tue, 23 Apr 2019 22:49:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlcfKLF+cpECjbnCR2v+5a0YabU5J3uDn0VJI1hkcqYUETs7kNIYcSNdRVgxONSd7FMpuM
X-Received: by 2002:a17:902:29ab:: with SMTP id h40mr30482790plb.269.1556084976229;
        Tue, 23 Apr 2019 22:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556084976; cv=none;
        d=google.com; s=arc-20160816;
        b=jMn6lnimlr8svBogjk4c1uSbhAJ/lBGPpuTk2GuYhHlVfarxOm3/RQLRQhO+WCF5SF
         yubfDfv0PsxZK5J5PHPA+znFnceb5vvndrThCvCq86DI60cMR+0fq6b0+KFJHzDM9MCP
         InwhE1zMqvV79E2sEVbGwt1kQ/NxWQSfEBf6QfPTLkwnSNsbvYCzVZ8s99G9RQmrQkb5
         frCW/A6rhsafAASFwiDnfPwLU9EAxwzv4pDCc3gTAsTkDcxQvfH4gM0NNrfKGZShK6M2
         hHlik4gKeZiHBMPx5KvlvTy4CEtE0A4T9f6u5wl2HdiREmLQ9RdPsRu2Vly3UVu67nK0
         P9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=jSG4T2PcDxzqXipplwZkbIpxj8T0+2Fa1MxNuWmyUkE=;
        b=VZAeHrP5Rp/65zXNI1NLibD2AtxTIj1yx2vEMfhiTRDohBnyCn9s4vQ/Kw9ty0gaxP
         1fiixrz0c7IdiKMUS+UYuSRx7KMaJ8GU4KFI5VVhsEzjNrbBjEvRVpKw/WqDjtWT204P
         yaEoI8akDd2UHxkJDIEv5pNOVg5bwuo8opXFWOeisnhxbMl+8sXPHOAJbM51EdCa8wif
         9t8emcH8lTxqlZKuMLJtIGqft8Hy31BhiGfoH8xzgWKW32Vx88WNDeKO8NmUALr1xILh
         IC6WUPJKw+eZfOe+9jCrslvoEmfGD69twSc6dCD6ql8WMbyCVdDXnzmiIZXeboZ4yCjx
         QZQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id n7si18357692pff.190.2019.04.23.22.49.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 22:49:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCBC8919C;
	Wed, 24 Apr 2019 05:49:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4B8919C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 05:49:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 22:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="143140552"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 23 Apr 2019 22:49:33 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gvt: Tiled Resources mmios are in-context mmios
 for gen9+
Date: Wed, 24 Apr 2019 01:43:59 -0400
Message-Id: <20190424054359.8109-1-yan.y.zhao@intel.com>
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

VFJWQVRUTDNQVFJEVygweDRkZTAtMHg0ZGU0KSwgVFJOVUxMREVUQ1QoMHg0ZGU4KSwgVFJJTlZU
SUxFREVUQ1QoMHg0ZGVjKSwKVFJUVEUoMHg0ZGYwKSwgVFJWQURSKDB4NGRmNCkgYXJlIGluLWNv
bnRleHQgbW1pb3MgZm9yIGdlbjkrCgpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhh
b0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5j
IHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2Nv
bnRleHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwppbmRleCBl
N2UxNGM4NDJiZTQuLmVlMGQ1NmVkNWIzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21taW9fY29udGV4dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlv
X2NvbnRleHQuYwpAQCAtMTA4LDEyICsxMDgsMTIgQEAgc3RhdGljIHN0cnVjdCBlbmdpbmVfbW1p
byBnZW45X2VuZ2luZV9tbWlvX2xpc3RbXSBfX2NhY2hlbGluZV9hbGlnbmVkID0gewogCXtSQ1Mw
LCBHRU45X0hBTEZfU0xJQ0VfQ0hJQ0tFTjUsIDB4ZmZmZiwgdHJ1ZX0sIC8qIDB4ZTE4OCAqLwog
CXtSQ1MwLCBHRU45X0hBTEZfU0xJQ0VfQ0hJQ0tFTjcsIDB4ZmZmZiwgdHJ1ZX0sIC8qIDB4ZTE5
NCAqLwogCXtSQ1MwLCBHRU44X1JPV19DSElDS0VOLCAweGZmZmYsIHRydWV9LCAvKiAweGU0ZjAg
Ki8KLQl7UkNTMCwgVFJWQVRUTDNQVFJEVygwKSwgMCwgZmFsc2V9LCAvKiAweDRkZTAgKi8KLQl7
UkNTMCwgVFJWQVRUTDNQVFJEVygxKSwgMCwgZmFsc2V9LCAvKiAweDRkZTQgKi8KLQl7UkNTMCwg
VFJOVUxMREVUQ1QsIDAsIGZhbHNlfSwgLyogMHg0ZGU4ICovCi0Je1JDUzAsIFRSSU5WVElMRURF
VENULCAwLCBmYWxzZX0sIC8qIDB4NGRlYyAqLwotCXtSQ1MwLCBUUlZBRFIsIDAsIGZhbHNlfSwg
LyogMHg0ZGYwICovCi0Je1JDUzAsIFRSVFRFLCAwLCBmYWxzZX0sIC8qIDB4NGRmNCAqLworCXtS
Q1MwLCBUUlZBVFRMM1BUUkRXKDApLCAwLCB0cnVlfSwgLyogMHg0ZGUwICovCisJe1JDUzAsIFRS
VkFUVEwzUFRSRFcoMSksIDAsIHRydWV9LCAvKiAweDRkZTQgKi8KKwl7UkNTMCwgVFJOVUxMREVU
Q1QsIDAsIHRydWV9LCAvKiAweDRkZTggKi8KKwl7UkNTMCwgVFJJTlZUSUxFREVUQ1QsIDAsIHRy
dWV9LCAvKiAweDRkZWMgKi8KKwl7UkNTMCwgVFJWQURSLCAwLCB0cnVlfSwgLyogMHg0ZGYwICov
CisJe1JDUzAsIFRSVFRFLCAwLCB0cnVlfSwgLyogMHg0ZGY0ICovCiAKIAl7QkNTMCwgUklOR19H
RlhfTU9ERShCTFRfUklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIyOWMgKi8KIAl7
QkNTMCwgUklOR19NSV9NT0RFKEJMVF9SSU5HX0JBU0UpLCAweGZmZmYsIGZhbHNlfSwgLyogMHgy
MjA5YyAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
