Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2687432ywd;
        Sun, 13 Jan 2019 22:15:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4UC+7FLpmIxeZzaXSPl5tAGmguww74w8SBp77H4+tvIcVYXmL3cVtWqOMQINDo79F+uQu4
X-Received: by 2002:a17:902:9691:: with SMTP id n17mr24789193plp.9.1547446552263;
        Sun, 13 Jan 2019 22:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547446552; cv=none;
        d=google.com; s=arc-20160816;
        b=tXFc5mbkfhphguYjiPU56KissvD122B2OkHsWJ6R5el/d7JNj/C3r71jvY2zSPwVFu
         L/zunk2HOtWuyPQt52inpsYOKTEbqtB/XC+i+fWgYUWA1r1BSyRlGkrJf95dcLCQ8SQj
         rrCA39tDEZV1baSP5fKF3llHu7URPybMV38Y3m1GmVFi7m+ejxAPfQfMSOA/CsLtgiL4
         rhSzzy04a/8omSMrGckhAdrlhtYkqfoYnsDxvjgJ1LMWjg2pEIcJuBoGISQtBopsyp6/
         Vm1wEj734d3xG4+c4efJnmHF6PZ/fzarhP1OWOYAW5Dy8w/FEtZyvgNuWkVJKatPclQO
         or7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=IAMpds940CRQg7/KmmpCWFSLcHwH5otEhLm9x/7utJw=;
        b=M3mBpv+sZJe4CdVkDUFlX+WFAnJE54+YQZ9vmEyja5Aj4liXNEVPmhviIVpa3i/qtw
         nSbNnWgtK1YcxoM1M0CX56fw8zmaHYBiuK4Jyr3BIHwDt8lVUPDT5VKf+aD84+sLV+AY
         1xvSqMh/y4op1Ocw2TM2SNRtsx9rmMTYcoBk/iBodgBzFWAVwuHh8TyiIEGRq9wjxy9w
         PJNJzMm6wsZ23AnLbW/Mw0l3WzYIGl4h8pTIZ2TwoVcSGZY6J7Uh+2iGN6+VH6vrdf0x
         AVqj249qv5cnl6p4gR5aFZY0OfPw/kp5RRROzjYJDhdJxkvJ4Yj+paEOebWGg+lfVJKw
         cN1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v7si20165734pgs.304.2019.01.13.22.15.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 22:15:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845C06E22E;
	Mon, 14 Jan 2019 06:15:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68006E22E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 06:15:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50D328046D;
 Mon, 14 Jan 2019 06:15:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E43610027CE;
 Mon, 14 Jan 2019 06:15:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3377F16E03; Mon, 14 Jan 2019 07:15:45 +0100 (CET)
Date: Mon, 14 Jan 2019 07:15:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/5] vfio: update kernel headers.
Message-ID: <20190114061545.w27vjvwxbf3ucnds@sirius.home.kraxel.org>
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-2-kraxel@redhat.com>
 <fe14541c-8b57-014c-3972-113ce60161a1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe14541c-8b57-014c-3972-113ce60161a1@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 14 Jan 2019 06:15:50 +0000 (UTC)
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
 intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDk6MzI6NDNBTSAtMDYwMCwgRXJpYyBCbGFrZSB3cm90
ZToKPiBPbiAxLzExLzE5IDM6MzEgQU0sIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gPiBUZW1wb3Jh
cnksIGZvciB0ZXN0aW5nIGNvbnZpbmllbmNlLgo+IAo+IGNvbnZlbmllbmNlCj4gCj4gPiAKPiA+
IE9uY2UgcWVtdSBtYXN0ZXIgaXMgc3luY2VkIHdpdGggdGhlIGxpbnV4IDUuMC1yYzEgaGVhZGVy
cwo+ID4gdGhpcyBpcyBub3QgbmVlZGVkIGFueSBtb3JlLgo+IAo+IFdoYXQncyB0aGUgdGltZWxp
bmUgZm9yIHdoZW4gdGhhdCBwYXRjaCB3aWxsIGhhcHBlbiwgY29tcGFyZWQgdG8gd2hldGhlcgo+
IHdlIHdhbnQgdGhpcyBvbmUgbm93IGZvbGxvd2VkIGJ5IGEgcmV2ZXJ0PwoKUGFvbG8gYWxyZWFk
eSBwb3N0ZWQgcGF0Y2hlcyB0byB0aGUgbGlzdCwgSSBleHBlY3QgaXQgdG8gYmUgbWVyZ2VkIHdp
dGhpbgpkYXlzLiAgU28sIGVhc2llc3Qgd291bGQgYmUgdG8ganVzdCB3YWl0IGZvciB0aGF0IHRv
IGhhcHBlbiwgdGhlbiBkcm9wCnRoZSBwYXRjaC4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
