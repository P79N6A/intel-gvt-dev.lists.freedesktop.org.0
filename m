Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754644ywd;
        Fri, 11 Jan 2019 01:31:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN51bfvMEc4KGpJcVyp6AK0SzgofqX4CB2n8GM1CRM/b+/NsfNs2fQiswelKW4CAFzwC4npu
X-Received: by 2002:a62:8e19:: with SMTP id k25mr13770593pfe.185.1547199083954;
        Fri, 11 Jan 2019 01:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199083; cv=none;
        d=google.com; s=arc-20160816;
        b=R4EHHNPwvooBpehUhRFHeLeaY5SMbHN1maV9LJthJDr6pC8PgXRiREQoIX9BX0TUp3
         ZZIKqWTAZWxY77d4PlkrFzlSQJVy68FtMFmfqsXbcWmZO9zGmbOWPurQY9W7BEu42p6B
         UD3RstBq1hbpCgexO1UEdGrd+q66Z9wSDJAIf2TsIeJPupVCayczU3fEnaveOCX4gqoo
         tNn46r9pk9Qvu+vb5qhD/gWHrwNHfVXQzgBOgWb7p2zlmjaS+KzacKvaJAog/wmiSPHc
         1MksVCmkcKuKZmKM46gy9R1ujdYVt2HzJbToSWHs8OsOBLW6InvRuXkK4ucTtuK6bZwm
         do/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=nwsgCJZLDAIyeXvCRlBWat4KAemtdoGI4IpQ0N82fUY=;
        b=h5GIro6xNj1jsl/Ch3SUKLfaALccwIQEm4/WNzUxjFj3ZkKvD8Pjuy4I4UADi2n8/Z
         C7955mStUqWSrgObTOA/eQTSlg9+IT2qd2c/M82TeZmtE+OfZsqwzPx0UW79612XXnEZ
         81yl3z1aoWN6ogtQ6DRMPa0Hhmm7eWet2pQBStpI7g6ZzqX6mugCcuszBiwF04EmodVH
         7N59vnKkmMp30act6LCI/+Fihb7oRqF3HtMSX4HP4I1ucA5RqOxIm1TmgFWHLOCbDe/a
         B+DouszST0/iOSWhrTyAFrSVggLPUZdy3qHmOQ0qJBgw1dhy7rfUmv/IO/S2Agh/Hrxm
         8lZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 85si73963383pfc.145.2019.01.11.01.31.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B286F5B2;
	Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC91B6F5B2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09B0E8AE6E;
 Fri, 11 Jan 2019 09:31:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AFEB60C7F;
 Fri, 11 Jan 2019 09:31:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5244C9D84; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] vfio/display: add edid support.
Date: Fri, 11 Jan 2019 10:31:11 +0100
Message-Id: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 11 Jan 2019 09:31:22 +0000 (UTC)
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

VGhlIDUuMC1yYzEgbGludXgga2VybmVsIGhlYWRlciB1cGRhdGUgLS0gd2hpY2ggY29udGFpbnMg
dGhlIHZmaW8gYXBpCnVwZGF0ZSBmb3IgZWRpZCBzdXBwb3J0IC0tIGlzIGFib3V0IHRvIGxhbmQg
aW4gcWVtdSBtYXN0ZXIuICBJbnRlbCBqdXN0CnBvc3RlZCBwYXRjaGVzIGltcGxlbWVudGluZyBF
RElEIHN1cHBvcnQuICBUaW1lIHRvIHVuZHVzdCB0aGUgdGVzdApwYXRjaGVzLCBwb2xpc2ggdGhl
bSBhbmQgcG9zdCB0aGVtIGZvciByZXZpZXcgJiBtZXJnZS4KClRoaXMgc2VyaWVzIGFkZHMgRURJ
RCBzdXBwb3J0IHRvIHRoZSBxZW11IHZmaW8gZGlzcGxheSBjb2RlLiAgVmFyaW91cwpkaXNwbGF5
LXJlbGFkZWQgaW5mb3JtYXRpb24gLS0gbW9zdCBpbXBvcnRhbnRseSB0aGUgZGlzcGxheSByZXNv
bHV0aW9uCndoaWNoIHNob3VsZCBiZSB1c2VkIC0tIGlzIHBhc3NlZCB0byB0aGUgZ3Vlc3QgdGhh
dCB3YXkuICBUaGUgKGluaXRpYWwpCmRpc3BsYXkgcmVzb2x1dGlvbiBjYW4gYmUgc2V0IHVzaW5n
IHRoZSBuZXcgeHJlcyBhbmQgeXJlcyBwcm9wZXJ0aWVzLgpXaGVuIHN1cHBvcnRlZCBieSB0aGUg
VUkgaXQgd2lsbCBhbHNvIGJlIHVwZGF0ZWQgb24gd2luZG93IHJlc2l6ZXMuCgpHZXJkIEhvZmZt
YW5uICg1KToKICB2ZmlvOiB1cGRhdGUga2VybmVsIGhlYWRlcnMuCiAgdmZpby9kaXNwbGF5OiBh
ZGQgZWRpZCBzdXBwb3J0LgogIHZmaW8vZGlzcGxheTogYWRkIHhyZXMgKyB5cmVzIHByb3BlcnRp
ZXMKICB2ZmlvL2Rpc3BsYXk6IGRlbGF5IGxpbmsgdXAgZXZlbnQKICBbZGVidWddIHNvbWUgbG9n
Z2luZwoKIGh3L3ZmaW8vcGNpLmggICAgICAgICAgICAgICAgIHwgICAyICsKIGluY2x1ZGUvaHcv
dmZpby92ZmlvLWNvbW1vbi5oIHwgICA0ICsrCiBsaW51eC1oZWFkZXJzL2xpbnV4L3ZmaW8uaCAg
ICB8ICA1MCArKysrKysrKysrKysrCiBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAgICAgICB8IDE1
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGh3L3ZmaW8vcGNp
LmMgICAgICAgICAgICAgICAgIHwgICAyICsKIDUgZmlsZXMgY2hhbmdlZCwgMjE2IGluc2VydGlv
bnMoKykKCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2Cg==
