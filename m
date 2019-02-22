Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1520463ywe;
        Fri, 22 Feb 2019 07:24:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iage9J1LfpXH32PlQovhZ3h2Tc8HiXq5biVGtqlIrR0Y3e7nzzC6UlKlN3ririJJPzUMflq
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr4601694plb.120.1550849077274;
        Fri, 22 Feb 2019 07:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550849077; cv=none;
        d=google.com; s=arc-20160816;
        b=PdK3EST/ctImjFUwFxNfC9/c769/XMAdxld1YDzZi7VMr6OSqmkCHVRbQpuy6KaWZu
         LqvhmlE+CR5VOiD4bl4laVSC/8/D59EoJYB2GwCE8sbSDBC3pyPyO2iVWiD0l+lJTksy
         0acelTz9wwYXbxl/vMinfVKJPnN+0szOhrjFmZdm+BWY9zOK1cKCY1kMjqN0JheKMQBr
         U6XO+xk0h/8+QOn12T+VYYFhBUrnAFMFtJbD/4CxshNHvbKkVCSasRhOHUeWBz/1JxTM
         Ys9EkGDTFM0XE5PBm/2rquCfUFQxPARV7y9ce4qAez6C75yDagC52ydDwskY4hqKu+w/
         jDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:references:in-reply-to:subject:to:to
         :to:from:date:delivered-to;
        bh=isVYz2K83NsX5ZMwF2S8P8l+lzccDKVGfVQaSZI+Lp8=;
        b=hiQfVxOPzwwWHePzU/id+yHSepEq2fsc5qaltKYzt0wMIOzJbHi97O8sT9UPws1jE2
         8guYCWPt10Mgj7Zmz/lNmILi24ozyb3zGtWDiHgIHZd4Hgs0f67bK7OMhyDO9r1svVzS
         vxYFtRP6s04dBjNhz1A+Ag1HqFm72Jckhypi0MQpUQyQ1t3bdCkylko0qGzzBAgbYRok
         NhMPkPszh7pQmv+N4/pWNKjtRNQwEZPB53IWOrlX0y2U0e1959B4ZEaHT7vm4y8yNXKH
         M3my6wylnrqSxdyF72ZHotYXD084Moq0rCD//7FeajJ3uw/pzJT/u+Q4HuEzjcHtDHF6
         05cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 3si1596462plr.336.2019.02.22.07.24.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 07:24:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA58C89683;
	Fri, 22 Feb 2019 15:24:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630FB89683
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 15:24:35 +0000 (UTC)
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C8B620878;
 Fri, 22 Feb 2019 15:24:34 +0000 (UTC)
Date: Fri, 22 Feb 2019 15:24:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index
 check
In-Reply-To: <20190218064653.26020-1-zhenyuw@linux.intel.com>
References: <20190218064653.26020-1-zhenyuw@linux.intel.com>
Message-Id: <20190222152435.0C8B620878@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1550849075;
 bh=zqL5p3Dn1yim0fFpZ9HbMv4HoZ4JnlOL0onNxHH/KKk=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=W6GHi+oDsjTMgFFyFWDnbcWdwT8qNrKPvNQ0+wTZiMY2NlTvmF9WNjT+IP/cITRFR
 VN8gZF11S0iukXYA1s/ECvUZ5KjPwlm7BUsnjNALTdkJLaxuc7inlLzly6Dqdes5pt
 xpG8BVaEAGcFzpxxJCuxPWaup6anuarEOjqEJ2hk=
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
Cc: stable@vger.kernel.org
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
