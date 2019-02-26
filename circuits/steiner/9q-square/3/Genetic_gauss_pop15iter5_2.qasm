// Initial wiring: [0 1 2 3 5 7 6 4 8]
// Resulting wiring: [0 1 2 3 5 7 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[5], q[0];
cx q[3], q[4];
