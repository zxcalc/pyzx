// Initial wiring: [18, 6, 14, 1, 13, 9, 0, 17, 8, 5, 19, 4, 11, 2, 16, 12, 10, 7, 3, 15]
// Resulting wiring: [18, 6, 14, 1, 13, 9, 0, 17, 8, 5, 19, 4, 11, 2, 16, 12, 10, 7, 3, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[11], q[6];
cx q[10], q[2];
cx q[11], q[3];
cx q[14], q[5];
cx q[16], q[7];
cx q[14], q[8];
cx q[18], q[9];
cx q[19], q[9];
cx q[14], q[17];
cx q[12], q[13];
cx q[2], q[18];
cx q[3], q[17];
cx q[4], q[9];
cx q[1], q[6];
