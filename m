Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp5411340ywd;
        Wed, 30 Jan 2019 02:33:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5UhwBzOiHZ4p+r00RrPqLrv8jtRYeVMYpIxhNG7Vv/ngmAHagrbDvPTkPn/kOhY38L04ZH
X-Received: by 2002:a17:902:9a8b:: with SMTP id w11mr29076561plp.121.1548844404967;
        Wed, 30 Jan 2019 02:33:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548844404; cv=none;
        d=google.com; s=arc-20160816;
        b=MYBnBlYcfDO6+XTW1NRwHr/j/0TsT7/oA4v2wpPIPKaOdJ+TWVu2Nx0KjlrZ6bV0/M
         6fIFnSKwf7X0lGzxPVWqSGX8nWOu2coEzY+h01erAWuOhRS37ihfLDqzlmeYisU0CeoN
         GSwPzlf/b49CVUJ6fA1PPDWQNTQtVqAXopiz9bAMuZt8c/lW+I3O2IkulwsNizyNpmSo
         iRlP4u0rYTx2tbJwq3H0uFOrMK8ZyRrVk2oHzIl71124ZndN9cDtG8/k+AU5eLURm7/T
         vZJ5TIwgN9imAHzNWatLl7BcS/w9mAOXihHQKE0rtzv3MHoEQ9FA8oobdo49iNaxuWEn
         9pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=Tw8QS4Pqy6ATkIsw+2bW3DB6QzDa7Moi2p+1PfVHtDk=;
        b=L27nmGECavcMWXJYKjFxgiBwFsP9boMrrxiQEs3ovQimdCIdk+sitK3sfIg3E3zsME
         Kcl2PB4uEzXieeg9t38G7yske9NmeAgheBhxaiYuuKWu38WBjhcuVHa3wlrkwRpwEGxW
         2ifQVqpP9pnVIayrvMglwRgUsQ698lKWzxaIjtp6GyoKADXFTF7+axYwSZQjcBr/ZUTW
         aN7DDlV4ugdv5T8KJiRSNnyzyZRyzpnv6sB+zbOs8D72oWHHaU6zmcyydBB+OxC5U5Wg
         nG8EqLQmJ1bJHWh5MNgVVrVTEQ1YPW8NjMFt+E2uvLB/cpq6u2lSmvL2mRhSDwtRPOrr
         FArg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id x10si1066157pgl.209.2019.01.30.02.33.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 02:33:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9E6E169;
	Wed, 30 Jan 2019 10:33:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C136E169
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Jan 2019 10:33:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2019 02:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,540,1539673200"; d="scan'208";a="110992987"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2019 02:33:20 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/i915/gvt: add VFIO graphics EDID region 
Date: Wed, 30 Jan 2019 18:25:51 +0800
Message-Id: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
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
IGRhdGEuCgp2MzogcmVmaW5lIGNvZGVzCnYyOiBhZGQgRURJRCBibG9iIHNhbml0eSBjaGVjayBh
bmQgc3VwcG9ydCBFRElEIHNpemUgdXBkYXRlIDx6aGVueXU+CgpIYW5nIFl1YW4gKDMpOgogIGRy
bS9pOTE1L2d2dDogYWRkIGZ1bmN0aW9ucyB0byBnZXQgZGVmYXVsdCByZXNvbHV0aW9uCiAgZHJt
L2k5MTUvZ3Z0OiBhZGQgaG90cGx1ZyBlbXVsYXRpb24KICBkcm0vaTkxNS9ndnQ6IGFkZCBWRklP
IEVESUQgcmVnaW9uCgogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYyAgIHwgIDMx
ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oICAgfCAgMzcgKysr
KysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgICAgICAgfCAgIDEgKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgIHwgICAzICsKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oeXBlcmNhbGwuaCB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYyAgICAgfCAxNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICB8ICAxNyArKysrKwogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAgICAgIHwgICA2ICsrCiA4IGZpbGVzIGNoYW5nZWQsIDIz
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
