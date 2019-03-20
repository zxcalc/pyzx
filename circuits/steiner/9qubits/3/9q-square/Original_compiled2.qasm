// Initial wiring: [0 7 2 3 1 5 6 4 8]
// Resulting wiring: [0 7 2 3 1 5 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[2], q[3];
cx q[7], q[6];
