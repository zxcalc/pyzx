// Initial wiring: [19, 15, 9, 17, 5, 8, 10, 16, 2, 14, 7, 13, 1, 11, 6, 18, 0, 4, 12, 3]
// Resulting wiring: [19, 15, 9, 17, 5, 8, 10, 16, 2, 14, 7, 13, 1, 11, 6, 18, 0, 4, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[3];
cx q[8], q[1];
cx q[11], q[10];
cx q[11], q[8];
cx q[12], q[6];
cx q[12], q[7];
cx q[6], q[3];
cx q[16], q[14];
cx q[14], q[5];
cx q[18], q[11];
cx q[11], q[10];
cx q[19], q[18];
cx q[16], q[17];
cx q[8], q[11];
cx q[7], q[13];
cx q[2], q[8];
