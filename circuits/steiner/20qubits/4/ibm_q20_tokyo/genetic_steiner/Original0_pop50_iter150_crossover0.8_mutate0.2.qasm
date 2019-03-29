// Initial wiring: [14, 0, 6, 17, 16, 13, 1, 10, 11, 2, 9, 3, 5, 8, 7, 18, 15, 4, 19, 12]
// Resulting wiring: [14, 0, 6, 17, 16, 13, 1, 10, 11, 2, 9, 3, 5, 8, 7, 18, 15, 4, 19, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[12];
cx q[18], q[11];
cx q[5], q[14];
cx q[1], q[2];
