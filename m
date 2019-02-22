Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1520412ywe;
        Fri, 22 Feb 2019 07:24:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaOUwTZUOQe9AXcf9OakH0mr2VYfpjIL2yFJwRhQBwvNFfZWtyDOTf7kIivlHhORlrMTxPA
X-Received: by 2002:a17:902:145:: with SMTP id 63mr4692624plb.256.1550849073923;
        Fri, 22 Feb 2019 07:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550849073; cv=none;
        d=google.com; s=arc-20160816;
        b=hqlpura6aRzKXJ7tuvPyz+wDUci4p2UcRn5/+1y/sJC454XkdOyRwZrSo9xql/5FWi
         kKdvKC5T6xa0hG3JHroArizb/kREY3b7IeIRwlXNC0WdRnxn+NRjk5gk7asn5KKidGj0
         Wl/N4scL5MKeyGl3q3Q+s8AICL1YNyWZSZTx/R71E4x6zul5v9k2b60YdQUH8i5IQ36l
         7+lpNebksSXmebiush5Itr/O8ZTyzfQO6YzO40I9saMchsFjDTybBlJEY2mcWjilO1De
         26CuMLEoDlfmuKLKImJOfl7DvDlZ8vLq1c1UWd6jvIo1rX0ctXwc/oKySgcOPzX5bCUT
         8ROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:references:in-reply-to:subject:to:to
         :to:from:date:delivered-to;
        bh=isVYz2K83NsX5ZMwF2S8P8l+lzccDKVGfVQaSZI+Lp8=;
        b=qbqam9UECnjm8tdc67GY5eBcdhhw+pEVOE+rPuEIbFctLz8v9MW0Oks7I4QdD5ewgQ
         x6Yk+2w7cO906pqJYrA5qEtpseWrT/l1naOb6Gt9Q3dLXTLYPmLnqmUqf6SbOaVu4WIk
         DsUnQCIUDwgzxrE2/KttKuBRSoMd7WOrslr/hM3D/Yr5rOAId7khO/DwsB66cHMiAmNl
         qIXYaWlyQGM4EL31lb9HqskVIFPqMm39Ft9RsT5ZMkAp7EUx6DyRcLlcVRv0jHG8umNU
         A7ptdIXQ2fF035bZQLGV7lfqBWi0rTqtzJELy4EwR1i5zswoYlnn3vOJbkMFaSFbp8Rl
         PazQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y11si1488698plk.323.2019.02.22.07.24.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 07:24:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB118966C;
	Fri, 22 Feb 2019 15:24:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89198966C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 15:24:31 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79E4220823;
 Fri, 22 Feb 2019 15:24:31 +0000 (UTC)
Date: Fri, 22 Feb 2019 15:24:30 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct
 index check
In-Reply-To: <20190220082504.15132-1-zhenyuw@linux.intel.com>
References: <20190220082504.15132-1-zhenyuw@linux.intel.com>
Message-Id: <20190222152431.79E4220823@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1550849071;
 bh=zqL5p3Dn1yim0fFpZ9HbMv4HoZ4JnlOL0onNxHH/KKk=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=V6HUYeGsyUeicWgNt2p29NvDR4XKkZ1yusSiE+ZGxDFZRsW+ywHQq67SJ+5egQkAG
 7exTYMABQvXb4oSXwjmeyfc2bAY4f62Zy858Q2KIck5bVIOVJ8EPHm7jETz+nLhoLu
 LUq4F7nCuA+ZQ3sDPwrNNHZ/EnCp6XltJoqTorpg=
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogYmUxZGE3MDcwYWVhIGRybS9pOTE1L2d2dDogdkdQVSBjb21tYW5kIHNjYW5uZXIuCgpUaGUg
Ym90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjQuMjAuMTEsIHY0LjE5LjI0LCB2
NC4xNC4xMDIuCgp2NC4xNC4xMDI6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5j
aWVzOgogICAgMGE1M2JjMDdmMDQ0ICgiZHJtL2k5MTUvZ3Z0OiBTZXBhcmF0ZSBjbWQgc2NhbiBm
cm9tIHJlcXVlc3QgYWxsb2NhdGlvbiIpCiAgICAwY2NlMjgyM2VkMzcgKCJkcm0vaTkxNS9ndnQ6
IFJlZmluZSBlcnJvciBoYW5kbGluZyBmb3IgcHJlcGFyZV9leGVjbGlzdF93b3JrbG9hZCIpCiAg
ICAxNDA2YTE0YjBlZDkgKCJkcm0vaTkxNS9ndnQ6IEludHJvZHVjZSBpbnRlbF92Z3B1X3N1Ym1p
c3Npb24iKQogICAgMWUzMTk3ZDZhZDczICgiZHJtL2k5MTUvZ3Z0OiBSZWZpbmUgZXJyb3IgaGFu
ZGxpbmcgZm9yIHBlcmZvcm1fYmJfc2hhZG93IikKICAgIDIxNTI3YThkYWZjNCAoImRybS9pOTE1
L2d2dDogRmFjdG9yIG91dCB2R1BVIHdvcmtsb2FkIGNyZWF0aW9uL2Rlc3Ryb3kiKQogICAgNTRj
ZmY2NDc5ZmQ4ICgiZHJtL2k5MTUvZ3Z0OiBNYWtlIGVsc3BfZHdvcmRzIGluIHRoZSByaWdodCBv
cmRlciIpCiAgICA1YzU2ODgzYTk1MzEgKCJkcm0vaTkxNS9ndnQ6IENoYW5nZSB0aGUgcmV0dXJu
IHR5cGUgZHVyaW5nIGNvbW1hbmQgc2NhbiIpCiAgICA1ZDVmZTE3NjE1NWUgKCJkcm0vaTkxNS9r
dm1ndDogU2FuaXRpemUgUENJIGJhciBlbXVsYXRpb24iKQogICAgNmQ3NjMwMzU1M2JhICgiZHJt
L2k5MTUvZ3Z0OiBNb3ZlIGNvbW1vbiB2R1BVIHdvcmtsb2FkIGNyZWF0aW9uIGludG8gc2NoZWR1
bGVyLmMiKQogICAgN2QxZTVjZGYwMTc4ICgiZHJtL2k5MTUvZ3Z0OiBGYWN0b3IgaW50ZWxfdmdw
dV9wYWdlX3RyYWNrIikKICAgIDk1NTZlMTE4ODg5MiAoImRybS9pOTE1L2d2dDogVXNlIEk5MTVf
R1RUX1BBR0VfU0laRSIpCiAgICA5YTk4MjllOWViOGIgKCJkcm0vaTkxNS9ndnQ6IE1vdmUgd29y
a2xvYWQgY2FjaGUgaW5pdC9jbGVhbiBpbnRvIGludGVsX3ZncHVfe3NldHVwLCBjbGVhbn1fc3Vi
bWlzc2lvbigpIikKICAgIGYwOTBhMDBkZjllYyAoImRybS9pOTE1L2d2dDogQWRkIGVtdWxhdGlv
biBmb3IgQkFSMiAoYXBlcnR1cmUpIHdpdGggbm9ybWFsIGZpbGUgUlcgYXBwcm9hY2giKQoKCkhv
dyBzaG91bGQgd2UgcHJvY2VlZCB3aXRoIHRoaXMgcGF0Y2g/CgotLQpUaGFua3MsClNhc2hhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
