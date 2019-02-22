Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1053144ywe;
        Thu, 21 Feb 2019 21:45:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZv89oKu4KwsQYKKi92UEzy7IRDl6VHFjOX1ZySueUDkKamx1yxdSz7t8VOn1b81mhOTH5h
X-Received: by 2002:a17:902:346:: with SMTP id 64mr2474540pld.337.1550814342957;
        Thu, 21 Feb 2019 21:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550814342; cv=none;
        d=google.com; s=arc-20160816;
        b=TkBdl1gaEmNpTKb37JgqDj9O0HO1G0KPZPS9yIJ5340WAJ5CDUZrzbY7FiTAxvo1eD
         uiBC8/TM/fUiEdqZLUy3nCUj8gH7uADBlYqOsEsJP/pOgfXzsn1cN+7hKXTCQPpO/UFr
         FIjyx1NuVm7pldEOB+HZL6qQ29AfHxhkfeSQ+N/jZdcid5UmlQJrCl1xXL5pPsRTG1gM
         BbCEFAoWzzUDjugZIEVFmGZra47OQ9qYmSZ+hQ+cQq7LPz9GvJIm827bMRuQVx203wcL
         z/N4orTpYr78tE7JExYe2Njgmiut8wAMKWI43NE1pem1hle9AtKqAXbfZgkBrCB7L6At
         myIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=9KVmXuOTGHGdnPbKoDCkn0ELdC1SkSPwJ/oFILMG5LE=;
        b=bZQGD2WQ5M+qAvri56Swx3AX2XeEq5Pl1EHwqmVDAmWp+hTNoJeKI172PlojEEL7o+
         r0qSyvNdCAn2NP5N1/IeAW/VJ6I8Ja/tPUPVj/8DM5hHYXszHJ+npS+qJdIbBaXUIMvy
         9Ns4Y9Q0WmSxWpLa6gJZQNKYcH9N6d29cOqJYsft1oJPsjiqcLijgGq0u2PQRVyS9SSy
         lZvkv75UAx4ilM1Yuy62lo1d3fvDnbVFuOE2ojuITMG2RPyrq6rwMCjlXCPK8x0BIGDU
         hn7DnZWbE/IMUh6DPy2OITRGzq4oTdaV2eqLoT9VYt3k4y5QHfDLaz6/PvPU+lBqCf5o
         jbiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g132si605506pfb.23.2019.02.21.21.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:45:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B28926B;
	Fri, 22 Feb 2019 05:45:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0A38926B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2F5E3099D38;
 Fri, 22 Feb 2019 05:45:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8323A5D705;
 Fri, 22 Feb 2019 05:45:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91E4711AAB; Fri, 22 Feb 2019 06:45:37 +0100 (CET)
Date: Fri, 22 Feb 2019 06:45:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 1/3] vfio/display: add edid support.
Message-ID: <20190222054537.eisshk2bg73pcd5p@sirius.home.kraxel.org>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-2-kraxel@redhat.com>
 <20190220145435.1881d7a8@w520.home>
 <20190221073850.rgygkl3uyn4rxswl@sirius.home.kraxel.org>
 <20190221103450.4f37e60f@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221103450.4f37e60f@w520.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 22 Feb 2019 05:45:41 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gVGhpcyBpcyB0aGUgdmRhZ2VudCB1c2luZyBpbnN0YWxsYXRpb24gbGlrZSB0aGlz
Ogo+IAo+IGh0dHBzOi8vd3d3Lm92aXJ0Lm9yZy9kZXZlbG9wL2luZnJhL3Rlc3Rpbmcvc3BpY2Uu
aHRtbAo+IAo+IGllLiB2ZHNlcnZpY2UgaW5zdGFsbCwgbmV0IHN0YXJ0IHZkc2VydmljZT8KCklm
IHRoZSBwYWdlIHNheXMgc28sIHByb2JhYmx5LgoKSSd2ZSB0ZXN0ZWQgdGhlIGFnZW50IHNldHVw
IHdpdGggbGludXggb25seSwgd2hlcmUgZXZlcnl0aGluZyBoYXBwZW5zCmF1dG9tYXRpY2FsbHks
IHlvdSBvbmx5IGhhdmUgdG8gbWFrZSBzdXJlIHNwaWNlLXZkYWdlbnQucnBtIGlzIGluc3RhbGxl
ZC4KCj4gSSdtIG5vdCBzZWVpbmcgYW55dGhpbmcgbWFnaWNhbGx5IGNoYW5nZSB3aGVuIEkgZG8g
dGhhdC4gIEkgZG8gaGF2ZSB0aGUKPiBkZWZhdWx0IHNlcmlhbCBhbmQgcmVkaXJlY3Rpb24gZGV2
aWNlcyBpbnN0YWxsZWQgYnkgdmlydC1tYW5hZ2VyOgoKVGhpcyBvbmUgdG9vPwoKICAgIDxjaGFu
bmVsIHR5cGU9J3NwaWNldm1jJz4KICAgICAgPHRhcmdldCB0eXBlPSd2aXJ0aW8nIG5hbWU9J2Nv
bS5yZWRoYXQuc3BpY2UuMCcvPgogICAgICA8YWRkcmVzcyB0eXBlPSd2aXJ0aW8tc2VyaWFsJyBj
b250cm9sbGVyPScwJyBidXM9JzAnIHBvcnQ9JzInLz4KICAgIDwvY2hhbm5lbD4KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
