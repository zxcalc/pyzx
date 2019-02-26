// Initial wiring: [0 3 1 8 7 5 6 2 4]
// Resulting wiring: [0 3 1 8 7 5 6 2 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[6], q[7];
cx q[6], q[5];
cx q[2], q[1];
cx q[5], q[4];
