// Initial wiring: [0 1 3 8 4 5 6 7 2]
// Resulting wiring: [0 1 3 8 4 6 5 7 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[2], q[1];
cx q[0], q[5];
cx q[2], q[3];
