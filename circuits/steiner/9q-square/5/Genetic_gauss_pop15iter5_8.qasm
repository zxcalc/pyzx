// Initial wiring: [0 1 2 3 4 5 8 7 6]
// Resulting wiring: [0 1 2 3 4 5 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[3], q[8];
cx q[4], q[1];
cx q[5], q[6];
cx q[2], q[3];
