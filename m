Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1055459ywe;
        Thu, 21 Feb 2019 21:49:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaY5xA6fk5rAGhMy7l+qAZ6vnSGqQrHbehE8AqJxbd9jFSIFRBs9V5n35oYrs64c+Md2p2N
X-Received: by 2002:a65:4608:: with SMTP id v8mr2371402pgq.9.1550814587259;
        Thu, 21 Feb 2019 21:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550814587; cv=none;
        d=google.com; s=arc-20160816;
        b=P3uOojAuGeelFGaSPabXZqE4ny8pwJld0eNxxjFsXHrgGAGxQqRNu+lp2FNRnrlEiM
         iace5EkVof4Xqm3VLEG2/Kc+dslxcQHHZcdAYoICCpCnDObEFDsrJEaiTH0SEzBk5vrK
         BwDy8DoYGAz8l8fcw3H7k+cHhwx8fxyDQimOXEILHZ+yKpNm34Nr7SO0LH7dl4wwLQ+8
         hqjPjTDUcyy/vdvoOqvMa2dIXe4hhvAVRVuZCOaBij5lHY11yGoVrmGfkdyF/5E41nwr
         PxeEV1J81NiFsUHx1ZHwSBr51YByy1qA8jPDTXP2kKQxZAS9mkTZatJsvKLE4U4YEAGR
         n9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=sg6qcbnre1315BXLMhZmBKJP0fYAFspwG5s4i91NjM4=;
        b=PsbPcJl0RmN7/1/FOSRd8Fd/UH/exFS/w4qAV6NZK45jGenxCXIcQ5kWplU0DIlJM1
         BtgmOetj701Y0/KHJ5rGFSEHoinUtyFP9bTtvh6/7ASKGs6+BNayRAn/B8JR5NVnu34W
         z6MsH6bB38Wu+4Tn+Lcv5oi/jQmP69NAo2HMT10u/MrThovl/yIC4vdnHuQE0y94RtH7
         bdWUElmRQHRdHdqk5+c0l5mpC5Y0okekCLALmvdLqZiAlqfOPyglag6/hX4LlPYIhRlB
         Yaa5HUo5OKid2H8ecpKTi2E/ExEPqRtLd2r4hp6HxNMOlEdMKVX0deUIGidZyqF9wPmc
         PvOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b8si504280pgw.561.2019.02.21.21.49.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:49:47 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CF78929D;
	Fri, 22 Feb 2019 05:49:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ADE89289
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 394A4C04B948;
 Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78EE55D9D4;
 Fri, 22 Feb 2019 05:49:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7903111AAB; Fri, 22 Feb 2019 06:49:39 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] vfio/display: add edid support.
Date: Fri, 22 Feb 2019 06:49:36 +0100
Message-Id: <20190222054939.19739-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
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

VGhlIDUuMCBsaW51eCBrZXJuZWwgaGVhZGVyIHVwZGF0ZSBmaW5hbGx5IGxhbmRlZCBpbiBtYXN0
ZXIuICBTbyB0aGlzCnNlcmllcyBoYXMgbm8gdW5tZXJnZWQgZGVwZW5kZW5jaWVzIGFueSBtb3Jl
LiAgUmViYXNpbmcgYW5kIHJlLXNlbmRpbmcKZm9yIG1lcmdlLgoKVGhpcyBzZXJpZXMgYWRkcyBF
RElEIHN1cHBvcnQgdG8gdGhlIHFlbXUgdmZpbyBkaXNwbGF5IGNvZGUuICBWYXJpb3VzCmRpc3Bs
YXktcmVsYWRlZCBpbmZvcm1hdGlvbiAtLSBtb3N0IGltcG9ydGFudGx5IHRoZSBkaXNwbGF5IHJl
c29sdXRpb24Kd2hpY2ggc2hvdWxkIGJlIHVzZWQgLS0gaXMgcGFzc2VkIHRvIHRoZSBndWVzdCB0
aGF0IHdheS4gIFRoZSAoaW5pdGlhbCkKZGlzcGxheSByZXNvbHV0aW9uIGNhbiBiZSBzZXQgdXNp
bmcgdGhlIG5ldyB4cmVzIGFuZCB5cmVzIHByb3BlcnRpZXMuCldoZW4gc3VwcG9ydGVkIGJ5IHRo
ZSBVSSBpdCB3aWxsIGFsc28gYmUgdXBkYXRlZCBvbiB3aW5kb3cgcmVzaXplcy4KCnYzOgogLSBj
aGFuZ2UgeHJlcyt5cmVzIHByb3BlcnR5IGVycm9yIGhhbmRsaW5nLgogLSBzd2FwIG9uZSBsZWZ0
b3ZlciBmcHJpbnRmIGZvciBhIHRyYWNlcG9pbnQuCgpHZXJkIEhvZmZtYW5uICgzKToKICB2Zmlv
L2Rpc3BsYXk6IGFkZCBlZGlkIHN1cHBvcnQuCiAgdmZpby9kaXNwbGF5OiBhZGQgeHJlcyArIHly
ZXMgcHJvcGVydGllcwogIHZmaW8vZGlzcGxheTogZGVsYXkgbGluayB1cCBldmVudAoKIGh3L3Zm
aW8vcGNpLmggICAgICAgICAgICAgICAgIHwgICAyICsKIGluY2x1ZGUvaHcvdmZpby92ZmlvLWNv
bW1vbi5oIHwgICA0ICsrCiBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAgICAgICB8IDE1NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGh3L3ZmaW8vcGNpLmMgICAg
ICAgICAgICAgICAgIHwgIDEyICsrKysKIGh3L3ZmaW8vdHJhY2UtZXZlbnRzICAgICAgICAgIHwg
ICA3ICsrCiA1IGZpbGVzIGNoYW5nZWQsIDE4MCBpbnNlcnRpb25zKCspCgotLSAKMi45LjMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
