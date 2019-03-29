// Initial wiring: [3, 14, 19, 0, 8, 18, 1, 10, 17, 13, 7, 11, 9, 4, 5, 2, 16, 12, 15, 6]
// Resulting wiring: [3, 14, 19, 0, 8, 18, 1, 10, 17, 13, 7, 11, 9, 4, 5, 2, 16, 12, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[7], q[1];
cx q[14], q[13];
cx q[14], q[5];
cx q[18], q[12];
cx q[11], q[17];
cx q[0], q[1];
